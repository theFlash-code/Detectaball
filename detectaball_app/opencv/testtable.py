import cv2
import numpy as np

global l_dx
global l_dy

list = []
list2 = []
def empty(a):
    pass


def draw_direction(img, lx, ly, nx, ny):
    dx = nx - lx
    dy = ny - ly
    if abs(dx) < 4 and abs(dy) < 4:
        dx = 0
        dy = 0
    else:
        r = (dx**2 + dy**2)**0.5
        dx = int(dx/r*40)
        dy = int(dy/r*40)
        print(dx, dy)

        # 偵測桌子碰撞
        if(len(list) != 0):
            if(list[0] > 0 and dy < 0):
                if((list2[0] > 0 and dx < 0) or (list2[0] < 0 and dx > 0)):
                    print(0)
                elif(lx<320):#左邊
                    cv2.rectangle(img, (nx, ny), (nx+20, ny+20), (255, 255, 0), 2)
                    print(list2[0])
                else:        #右邊
                    cv2.rectangle(img, (nx, ny), (nx+20, ny+20), (255, 255, 0), 2)
        
        #偵測跟球拍碰撞
        if(len(list2) != 0):
            if((list2[0] <= 0 and dx >= 0)):
                print(0)
                if(nx<320):
                    cv2.rectangle(img, (nx, ny), (nx+20, ny+20), (255, 255, 255), 2)
            elif((list2[0] >= 0 and dx <= 0)):
                if(lx>320):
                    cv2.rectangle(img, (nx, ny), (nx+20, ny+20), (0, 255, 255), 2)
        if(len(list) != 0):
            list.remove(list[0])
        if(len(list2) != 0):
            list2.remove(list2[0])
        list.append(dy)
        list2.append(dx)
    #if(dx !=  or dy != l_dy):
     #   cv2.rectangle(img, (nx, ny), (nx+2, ny+2), (0, 255, 0), 2)
        
    #l_dx = dx
    #l_dy = dy
    cv2.arrowedLine(img, (60, 100), (60+dx, 100+dy), (0, 255, 0), 2)



frameWidth = 640
frameHeight = 480
cap = cv2.VideoCapture("C:\\Users\\Administration\\Desktop\\test\\table5.mp4")
cap.set(3, frameWidth)
cap.set(4, frameHeight)
cap.set(10, 80)
cap.set(cv2.CAP_PROP_FPS, 80)
pulse_ms = 20


# cv2.namedWindow("HSV")
# cv2.resizeWindow("HSV", 640, 300)
# cv2.createTrackbar("HUE Min", "HSV", 4, 179, empty)
# cv2.createTrackbar("SAT Min", "HSV", 180, 255, empty)
# cv2.createTrackbar("VALUE Min", "HSV", 156, 255, empty)
# cv2.createTrackbar("HUE Max", "HSV", 32, 179, empty)
# cv2.createTrackbar("SAT Max", "HSV", 255, 255, empty)
# cv2.createTrackbar("VALUE Max", "HSV", 255, 255, empty)

lower = np.array([4, 180, 156])     # 适用于橙色乒乓球4<=h<=32
upper = np.array([32, 255, 255])    #色相、飽和度、亮度

targetPos_x = 0
targetPos_y = 0
lastPos_x = 0
lastPos_y = 0

while True:
    _, img = cap.read()

    imgHsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)

    # h_min = cv2.getTrackbarPos("HUE Min", "HSV")
    # h_max = cv2.getTrackbarPos("HUE Max", "HSV")
    # s_min = cv2.getTrackbarPos("SAT Min", "HSV")
    # s_max = cv2.getTrackbarPos("SAT Max", "HSV")
    # v_min = cv2.getTrackbarPos("VALUE Min", "HSV")
    # v_max = cv2.getTrackbarPos("VALUE Max", "HSV")
    #
    # lower = np.array([h_min, s_min, v_min])
    # upper = np.array([h_max, s_max, v_max])

    imgMask = cv2.inRange(imgHsv, lower, upper)
    imgOutput = cv2.bitwise_and(img, img, mask=imgMask)
    contours, hierarchy = cv2.findContours(imgMask, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_NONE)

    imgMask = cv2.cvtColor(imgMask, cv2.COLOR_GRAY2BGR)


    x, y, w, h = 0, 0, 0, 0
    for cnt in contours:
        area = cv2.contourArea(cnt)
        # print(area)
        if area > 0:
            x, y, w, h = cv2.boundingRect(cnt)
            lastPos_x = targetPos_x
            lastPos_y = targetPos_y
            targetPos_x = int(x+w/2)
            targetPos_y = int(y+h/2)
            cv2.rectangle(img, (x, y), (x+w, y+h), (0, 255, 0), 2)
            cv2.circle(img, (targetPos_x, targetPos_y), 2, (0, 255, 0), 4)

   
    cv2.putText(img, "({:0<2d}, {:0<2d})".format(targetPos_x, targetPos_y), (20, 30),
                cv2.FONT_HERSHEY_PLAIN, 1, (0, 255, 0), 2) 
    draw_direction(img, lastPos_x, lastPos_y, targetPos_x, targetPos_y)

    imgStack = np.hstack([img, imgOutput])

    cv2.imshow('Horizontal Stacking', imgStack)
    if cv2.waitKey(pulse_ms) & 0xFF == ord('q'):
        print("Quit\n")
        break

cap.release()
cv2.destroyAllWindows()