import cv2
import numpy as np

list = []
list2 = []
list3 = []
list4 = []
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

        # 偵測桌子碰撞------------------------------------------------------------------
        if(len(list) != 0):
            if(list[0] > 0 and dy < 0):
                if((list2[0] > 0 and dx < 0) or (list2[0] < 0 and dx > 0)):
                    print(0)
                elif(lx<320):#左邊
                    cv2.rectangle(img, (nx, ny), (nx+20, ny+20), (255, 255, 0), 2)
                    print(list2[0])
                else:        #右邊
                    cv2.rectangle(img, (nx, ny), (nx+20, ny+20), (255, 255, 0), 2)
        #------------------------------------------------------------------------------
        #偵測跟球拍碰撞-----------------------------------------------------------------
        # if(len(list2) != 0):
        #     if((list2[0] <= 0 and dx >= 0)):
        #         print(0)
        #         if(nx<320):
        #             cv2.rectangle(img, (nx, ny), (nx+20, ny+20), (255, 255, 255), 2)
        #     elif((list2[0] >= 0 and dx <= 0)):
        #         if(lx>320):
        #             cv2.rectangle(img, (nx, ny), (nx+20, ny+20), (0, 255, 255), 2)
        #------------------------------------------------------------------------------
        if(len(list) != 0):
            list.remove(list[0])
        if(len(list2) != 0):
            list2.remove(list2[0])
        list.append(dy)
        list2.append(dx)
        list3.append(dy)
        list4.append(dx)
        
    cv2.arrowedLine(img, (60, 100), (60+dx, 100+dy), (0, 255, 0), 2)


frameWidth = 640
frameHeight = 480
cap = cv2.VideoCapture("C:\\Users\\Administration\\Desktop\\test\\table5.mp4")
cap.set(3, frameWidth)
cap.set(4, frameHeight)
cap.set(10, 80)
# cap.set(cv2.CAP_PROP_FPS, 10)
pulse_ms = 30


lower = np.array([4, 180, 156])
upper = np.array([32, 255, 255])

targetPos_x = 0
targetPos_y = 0
lastPos_x = 0
lastPos_y = 0

while True:
    _, img = cap.read()

    imgHsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
    imgMask = cv2.inRange(imgHsv, lower, upper)
    imgOutput = cv2.bitwise_and(img, img, mask=imgMask)
    contours, hierarchy = cv2.findContours(imgMask, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_NONE)

    imgMask = cv2.cvtColor(imgMask, cv2.COLOR_GRAY2BGR)


    x, y, w, h = 0, 0, 0, 0
    #球桌可用------------------------------
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
    #--------------------------------------
    #球拍可用------------------------------
    # if len(contours) != 0: 
    #     cnt = contours[0]
    # area = cv2.contourArea(cnt)
    #     # print(area)
    # if area > 0:
    #     x, y, w, h = cv2.boundingRect(cnt)
    #     lastPos_x = targetPos_x
    #     lastPos_y = targetPos_y
    #     targetPos_x = int(x+w/2)
    #     targetPos_y = int(y+h/2)
    #     cv2.rectangle(img, (x, y), (x+w, y+h), (0, 255, 0), 2)
    #     cv2.circle(img, (targetPos_x, targetPos_y), 2, (0, 255, 0), 4)
    #---------------------------------------
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