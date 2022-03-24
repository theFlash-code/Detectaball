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
image = cv2.imread('S__3293193.jpg')
H_rows, W_cols = image.shape[:2]
print(H_rows, W_cols)

# (順時針)四個角
# 原
pts1 = np.float32([[330,442],[819,448],[927,553],[237,540]])
# 變換後
pts2 = np.float32([[100,200],[1000,200],[1000,701],[100,701]])

# 生成透視變換矩陣；進行透視變換
M = cv2.getPerspectiveTransform(pts1, pts2)
dst = cv2.warpPerspective(image, M, (W_cols, H_rows))
plt.subplot(121), plt.imshow(image[:, :, ::-1]), plt.title('input')
plt.subplot(122), plt.imshow(dst[:, :, ::-1]), plt.title('output')
plt.show()