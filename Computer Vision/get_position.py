import cv2
import imutils

click_cnt = 0
point_x = 0
point_y = 0 

def click_event(event, x, y, flags, params):
    if event == cv2.EVENT_LBUTTONDOWN:
        print(x,' ', y)
        font = cv2.FONT_HERSHEY_SIMPLEX
        point_img = img.copy()
        # cv2.putText(point_img, str(x)+','+str(y), (x,y), font, 1, (255,0,0), 2)
        cv2.circle(point_img,(x,y), 2, (0,0,255), 2)
        cv2.imshow('image', point_img)
        
    # if event==cv2.EVENT_RBUTTONDOWN:
    #     print(x,' ', y)
    #     font = cv2.FONT_HERSHEY_SIMPLEX
    #     b = img[y,x,0]
    #     g = img[y,x,1]
    #     r = img[y,x,2]
    #     cv2.putText(img, str(b)+','+str(g)+','+str(r),(x,y),font,1,(255, 255, 0),2)
    #     cv2.imshow('image', img)

vid = cv2.VideoCapture('../../Detectaball_vid/table_tennis1.mp4')
success, img = vid.read()
img = imutils.resize(img, width=1080)

# img = cv2.imread('table_tennis.jpg', 1)
cv2.imshow('image', img)
cv2.setMouseCallback('image', click_event)
    
cv2.waitKey(0)
cv2.destroyAllWindows()