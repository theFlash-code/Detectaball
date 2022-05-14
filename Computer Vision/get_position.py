import cv2
import imutils
import numpy as np
from operator import itemgetter

def correct_skew():
    frameWidth = 320
    frameHeight = 240
    cap = cv2.VideoCapture("../../Detectaball_vid/table_tennis1.mp4")
    cap.set(3, frameWidth)
    cap.set(4, frameHeight)
    cap.set(1, 8)
    pulse_ms = 1

    while True:
        _, frame = cap.read()
        frame = imutils.resize(frame, width=1080)
        H_rows, W_cols = frame.shape[:2]

        pts1 = np.float32(points)
        pts2 = np.float32([[250,405],[250,100],[798,100],[798,405]])

        # 生成透視變換矩陣；進行透視變換
        M = cv2.getPerspectiveTransform(pts1, pts2)
        dst = cv2.warpPerspective(frame, M, (W_cols, H_rows))
        # cv2.imshow("input", )
        cv2.imshow("vid", dst)
        if cv2.waitKey(pulse_ms) & 0xFF == ord('q'):
            print("Quit\n")
            break
    cap.release()
    cv2.destroyAllWindows()


point_x = -1
point_y = -1
points = []

vid = cv2.VideoCapture('../../Detectaball_vid/table_tennis1.mp4')
success, img = vid.read()
img = imutils.resize(img, width=1080)

def cnfrmArea(x, y):
    print("checking",x,' ',y)
    if(x>=20 and x<=200 and y>=20 and y<=100):
        return True
    else:
        return False

def click_event(event, x, y, flags, params):
    global point_x, point_y, points
    if event == cv2.EVENT_LBUTTONDOWN:
        # print(point_x,' ',point_y)
        if(cnfrmArea(x,y) and point_x!=-1 and point_y!=-1):
            print(x,' ',y,"confirm")
            # store
            points.append([point_x, point_y])

            # update img
            cv2.circle(img,(point_x,point_y), 2, (0,0,255), 2)
            # finished
            if(len(points)>=4):
                points = sorted(points, key = itemgetter(0,1))
                for item in points:
                    print(item,' ')
                correct_skew()
        else:
            print(x,' ', y)

            point_img = img.copy()
            # font = cv2.FONT_HERSHEY_SIMPLEX
            # cv2.putText(point_img, str(x)+','+str(y), (x,y), font, 1, (255,0,0), 2)
            cv2.circle(point_img,(x,y), 2, (0,0,255), 2)
            point_x = x
            point_y = y
            cv2.imshow('image', point_img)

cv2.rectangle(img, (20, 20), (200, 100), (255,255,255), 3, cv2.LINE_AA)
cv2.putText(img, "confirm", (50, 70), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 1, cv2.LINE_AA)
# img = cv2.imread('table_tennis.jpg', 1)
cv2.imshow('image', img)
cv2.setMouseCallback('image', click_event)
    
cv2.waitKey(0)
cv2.destroyAllWindows()