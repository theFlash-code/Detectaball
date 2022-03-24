import imp
import numpy as np
import argparse
import cv2
import matplotlib
matplotlib.use("TkAgg")
import matplotlib.pyplot as plt

# construct the argument parse and parse the arguments
ap = argparse.ArgumentParser()
ap.add_argument("-i", "--image", required=False, help="S__3293193.jpg")
args = vars(ap.parse_args())

# load the image from disk
image = cv2.imread('table_tennis.jpg')
# cv2.imshow("img", image)
H_rows, W_cols = image.shape[:2]
print(H_rows, W_cols)

# (順時針)四個角
# 原
pts1 = np.float32([[506,487],[1429,455],[1642,639],[308,673]])
# 變換後
# pts2 = np.float32([[130,200],[1050,200],[1080,708],[100,708]])
# pts2 = np.float32([[100,200],[1000,200],[1000,701],[100,701]])
pts2 = np.float32([[500,200],[1596,200],[1596,810],[500,810]])

# 生成透視變換矩陣；進行透視變換
M = cv2.getPerspectiveTransform(pts1, pts2)
dst = cv2.warpPerspective(image, M, (W_cols, H_rows))
cv2.imshow("input", image)
cv2.imshow("output",dst)
# plt.subplot(121), plt.imshow(image[:, :, ::-1]), plt.title('input')
# # plt.subplot(122), plt.imshow(dst[:, :, ::-1]), plt.title('output')
# plt.show()
cv2.waitKey(0)