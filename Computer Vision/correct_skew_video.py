import cv2
import numpy as np
import imutils

frameWidth = 320
frameHeight = 240
cap = cv2.VideoCapture("E:\\Programming\\flutter\\Detectaball_vid\\table_tennis1.mp4")
cap.set(3, frameWidth)
cap.set(4, frameHeight)
cap.set(1, 8)
pulse_ms = 5

while True:
    _, frame = cap.read()
    frame = imutils.resize(frame, width=1080)
    H_rows, W_cols = frame.shape[:2]

    pts1 = np.float32([[289,268],[809,257],[927,360],[177,378]])
    pts2 = np.float32([[250,100],[798,100],[798,405],[250,405]])

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