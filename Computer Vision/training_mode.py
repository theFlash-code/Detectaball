import cv2
import imutils
import numpy as np
from operator import itemgetter
from PIL import Image

# def correct_skew_vid():
#     frameWidth = 320
#     frameHeight = 240
#     cap = cv2.VideoCapture("../../Detectaball_vid/table_tennis1.mp4")
#     cap.set(3, frameWidth)
#     cap.set(4, frameHeight)
#     cap.set(1, 8)
#     pulse_ms = 1

#     while True:
#         _, frame = cap.read()
#         frame = imutils.resize(frame, width=1080)
#         H_rows, W_cols = frame.shape[:2]

#         pts1 = np.float32(points)
#         pts2 = np.float32([[250,405],[250,100],[798,100],[798,405]])

#         # 生成透視變換矩陣；進行透視變換
#         M = cv2.getPerspectiveTransform(pts1, pts2)
#         dst = cv2.warpPerspective(frame, M, (W_cols, H_rows))
#         # cv2.imshow("input", )
#         cv2.imshow("vid", dst)
#         if cv2.waitKey(pulse_ms) & 0xFF == ord('q'):
#             print("Quit\n")
#             break
#     cap.release()
#     cv2.destroyAllWindows()

point_x = -1
point_y = -1
points = []

def correct_skew(training_result, list):
    # img = Image.fromarray(array)
    # image = cv2.imread('table_tennis.jpg')
    # print(type(image))
    points = np.array(list)
    print(type(training_result))
    pts1 = np.float32([[179,421],[287,309],[807,298],[928,404]])
    pts2 = np.float32([[250,405],[250,100],[798,100],[798,405]])
    # cv2.imshow(training_result)
    H_rows, W_cols = training_result.shape[:2]
    print(type(points))
    M = cv2.getPerspectiveTransform(points, pts2)
    dst = cv2.warpPerspective(training_result, M, (W_cols, H_rows))
    cv2.imshow('training img', dst)
    cv2.waitKey(0)

prev_dx = 0
prev_dy = 0


def get_training_data():
    cap = cv2.VideoCapture("../../Detectaball_vid/table_tennis1.mp4")
    success, training_img = cap.read()
    training_img = imutils.resize(training_img, width=1080)

    def draw_direction(img, lx, ly, nx, ny):
        # 根据上一位置与当前位置计算移动方向并绘制箭头
        dx = nx - lx
        dy = ny - ly

        global prev_dy
        # collision
        # print(prev_dy, dy)
        if(prev_dy > 0 and dy < 0):
            mx = round((nx+lx)/2)
            my = round((ny+ly)/2)+prev_dy
            cv2.circle(training_img,(mx, my), 2, (0,0,255), 2)
            cv2.imshow('training result',training_img)
            # correct_skew(img, points)
            # print("collision")
        
        prev_dy = dy
        if abs(dx) < 4 and abs(dy) < 4:
            dx = 0
            dy = 0
        else:
            r = (dx**2 + dy**2)**0.5
            dx = int(dx/r*40)
            dy = int(dy/r*40)
            # print(dx, dy)
        cv2.arrowedLine(img, (60, 100), (60+dx, 100+dy), (0, 255, 0), 2)
        # print(nx-lx, ny-ly)   # 噪声一般为+-1
        # cv2.arrowedLine(img, (150, 150), (150+(nx-lx)*4, 150+(ny-ly)*4), (0, 0, 255), 2, 0, 0, 0.2)



    frameWidth = 640
    frameHeight = 480  # 0对应笔记本自带摄像头
    cap.set(3, frameWidth)  # set中，这里的3，下面的4和10是类似于功能号的东西，数字的值没有实际意义
    cap.set(4, frameHeight)
    cap.set(10, 80)        # 设置亮度
    pulse_ms = 30

    # 调试用代码，用来产生控制滑条
    # cv2.namedWindow("HSV")
    # cv2.resizeWindow("HSV", 640, 300)
    # cv2.createTrackbar("HUE Min", "HSV", 4, 179, empty)
    # cv2.createTrackbar("SAT Min", "HSV", 180, 255, empty)
    # cv2.createTrackbar("VALUE Min", "HSV", 156, 255, empty)
    # cv2.createTrackbar("HUE Max", "HSV", 32, 179, empty)
    # cv2.createTrackbar("SAT Max", "HSV", 255, 255, empty)
    # cv2.createTrackbar("VALUE Max", "HSV", 255, 255, empty)

    lower = np.array([0, 180, 156])     # 适用于橙色乒乓球4<=h<=32
    upper = np.array([21, 255, 255])

    targetPos_x = 0
    targetPos_y = 0
    lastPos_x = 0
    lastPos_y = 0

    while True:
        _, img = cap.read()
        img = imutils.resize(img, width=1080)
        imgHsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)

        # h_min = cv2.getTrackbarPos("HUE Min", "HSV")
        # h_max = cv2.getTrackbarPos("HUE Max", "HSV")
        # s_min = cv2.getTrackbarPos("SAT Min", "HSV")
        # s_max = cv2.getTrackbarPos("SAT Max", "HSV")
        # v_min = cv2.getTrackbarPos("VALUE Min", "HSV")
        # v_max = cv2.getTrackbarPos("VALUE Max", "HSV")
        
        # lower = np.array([h_min, s_min, v_min])
        # upper = np.array([h_max, s_max, v_max])

        imgMask = cv2.inRange(imgHsv, lower, upper)     # 获取遮罩
        imgOutput = cv2.bitwise_and(img, img, mask=imgMask)
        contours, hierarchy = cv2.findContours(imgMask, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_NONE)   # 查找轮廓
        # https://blog.csdn.net/laobai1015/article/details/76400725
        # CV_RETR_EXTERNAL 只检测最外围轮廓
        # CV_CHAIN_APPROX_NONE 保存物体边界上所有连续的轮廓点到contours向量内
        imgMask = cv2.cvtColor(imgMask, cv2.COLOR_GRAY2BGR)     # 转换后，后期才能够与原画面拼接，否则与原图维数不同

        # 下面的代码查找包围框，并绘制
        x, y, w, h = 0, 0, 0, 0
        for cnt in contours:
            area = cv2.contourArea(cnt)
            # print(area)
            if area > 5:
                x, y, w, h = cv2.boundingRect(cnt)
                lastPos_x = targetPos_x
                lastPos_y = targetPos_y
                targetPos_x = int(x+w/2)
                targetPos_y = int(y+h/2)
                cv2.rectangle(img, (x, y), (x+w, y+h), (0, 255, 0), 2)
                cv2.circle(img, (targetPos_x, targetPos_y), 2, (0, 255, 0), 4)

        # 坐标（图像内的）
        cv2.putText(img, "({:0<2d}, {:0<2d})".format(targetPos_x, targetPos_y), (20, 30),
                    cv2.FONT_HERSHEY_PLAIN, 1, (0, 255, 0), 2)  # 文字
        draw_direction(img, lastPos_x, lastPos_y, targetPos_x, targetPos_y)

        imgStack = np.hstack([img, imgOutput])
        # imgStack = np.hstack([img, imgMask])            # 拼接
        cv2.imshow('Horizontal Stacking', imgStack)     # 显示
        if cv2.waitKey(pulse_ms) & 0xFF == ord('q'):          # 按下“q”推出（英文输入法）
            print("Quit\n")
            break
    
    correct_skew(training_img, points)
    cap.release()
    cv2.destroyAllWindows()


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
                get_training_data()
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