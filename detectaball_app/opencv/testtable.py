import cv2
import numpy as np
import time

list = []
list2 = []
Collision = [0, 0, 0, 0]  #前三球
Collision2 = [0, 0, 0, 0] #後面球數
#[0]:左拍, [1]:右拍, [2]:左桌, [3]:右桌
Leftpoint = 15
Rightpoint = 16
start = time.time()

def empty(a):
    pass


def draw_direction(img, lx, ly, nx, ny):
    global count, start
    dx = nx - lx
    dy = ny - ly
    if abs(dx) < 4 and abs(dy) < 4:
        dx = 0
        dy = 0
    else:
        r = (dx**2 + dy**2)**0.5
        dx = int(dx/r*40)
        dy = int(dy/r*40)
        # print(dx, dy)

        # 偵測桌子碰撞---------------------------------------------------------------
        if(len(list) != 0):
            if(list[0] > 0 and dy < 0):
                if((list2[0] > 0 and dx < 0) or (list2[0] < 0 and dx > 0)):
                    print(0)
                elif(lx<320):#左邊
                    count += 1
                    Collision[2] += 1
                    if(count>3):
                        Collision2[2] += 1
                    print(Collision2)
                    cv2.rectangle(img, (nx, ny), (nx+20, ny+20), (100, 0, 100), 2)
                else:        #右邊
                    count += 1
                    Collision[3] += 1
                    if(count>3):
                        Collision2[3] += 1
                    print(Collision2)
                    cv2.rectangle(img, (nx, ny), (nx+20, ny+20), (255, 255, 0), 2)
                start = time.time()
        #---------------------------------------------------------------------------
        #偵測跟球拍碰撞--------------------------------------------------------------
        if(len(list2) != 0):
            if((list2[0] <= 0 and dx >= 0)):#左邊
                if(nx<320):
                    count += 1
                    Collision[0] += 1
                    if(count>3):
                        Collision2[0] += 1
                    print(Collision2)
                    cv2.rectangle(img, (nx, ny), (nx+20, ny+20), (255, 255, 255), 2)
            elif((list2[0] >= 0 and dx <= 0)):
                if(lx>320):#右邊
                    count += 1
                    Collision[1] += 1
                    if(count>3):
                        Collision2[1] += 1
                    print(Collision2)
                    cv2.rectangle(img, (nx, ny), (nx+20, ny+20), (0, 255, 255), 2)
            start = time.time()
        #---------------------------------------------------------------------------
        if(len(list) != 0):
            list.remove(list[0])
        if(len(list2) != 0):
            list2.remove(list2[0])
        list.append(dy)
        list2.append(dx)
        
    cv2.arrowedLine(img, (60, 100), (60+dx, 100+dy), (0, 255, 0), 2)
    
frameWidth = 640
frameHeight = 480
cap = cv2.VideoCapture("C:\\Users\\Administration\\Desktop\\test\\table8.mp4")
cap.set(3, frameWidth)
cap.set(4, frameHeight)
cap.set(10, 80)
# cap.set(cv2.CAP_PROP_FPS, 10)
pulse_ms = 30

lower = np.array([4, 180, 220])
upper = np.array([32, 255, 255])

targetPos_x = 0
targetPos_y = 0
lastPos_x = 0
lastPos_y = 0

count = 0
CountTableLeft = 0
CountTableRight = 0
CountRacketLeft = 0
CountRacketRight = 0

#考慮比分還沒11分 或 Duece之情況
while(Leftpoint<10 and Rightpoint<=10 or (Leftpoint>9 and abs(Leftpoint-Rightpoint)<2) or (Rightpoint>9 and abs(Leftpoint-Rightpoint)<2)):
    if((Leftpoint+Rightpoint)!=1 and int((Leftpoint+Rightpoint)/2)%2==1 and Leftpoint<10 and Rightpoint<10 or (Leftpoint>9 and ((Leftpoint+Rightpoint)%2)==1)):#右發
        while True:
            _, img = cap.read()

            imgHsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
            imgMask = cv2.inRange(imgHsv, lower, upper)
            imgOutput = cv2.bitwise_and(img, img, mask=imgMask)
            contours, hierarchy = cv2.findContours(imgMask, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_NONE)

            imgMask = cv2.cvtColor(imgMask, cv2.COLOR_GRAY2BGR)


            x, y, w, h = 0, 0, 0, 0

            if len(contours) != 0: 
                cnt = contours[0]
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
                
            cv2.putText(img, "({:0<2d}, {:0<2d})".format(targetPos_x, targetPos_y), (20, 30), cv2.FONT_HERSHEY_PLAIN, 1, (0, 255, 0), 2) 
            

            draw_direction(img, lastPos_x, lastPos_y, targetPos_x, targetPos_y)
            
            #如果是右邊發球
            # timeout的問題(含發球那3顆)
            if(time.time() - start > 2):
                if((Collision2[0]==1) and (Collision2[1]==0) and (Collision2[2]==0) and (Collision2[3]==0)) or ((Collision2[0]==0) and (Collision2[1]==0) and (Collision2[2]==0) and (Collision2[3]==0)):
                    Rightpoint+=1
                    Collision2[0]=0
                    Collision2[1]=0
                    Collision2[2]=0
                    Collision2[3]=0
                    print("右加分")
                    break
                elif((Collision2[0]==1) and (Collision2[1]==0) and (Collision2[2]==0) and (Collision2[3]==1)) or ((Collision2[0]==1) and (Collision2[1]==1) and (Collision2[2]==0) and (Collision2[3]==1)) or ((Collision2[0]==0) and (Collision2[1]==1) and (Collision2[2]==0) and (Collision2[3]==0)) or ((Collision2[0]==0) and (Collision2[1]==1) and (Collision2[2]==0) and (Collision2[3]==1)):
                    Leftpoint+=1
                    Collision2[0]=0
                    Collision2[1]=0
                    Collision2[2]=0
                    Collision2[3]=0
                    print("左加分")
                    break
            
            if(count <= 3 and count > 0):#前三球(含發球)
                if(((Collision[0]==0) and (Collision[1]==1) and (Collision[2]==0) and (Collision[3]==0)) or ((Collision[0]==0) and (Collision[1]==1) and (Collision[2]==0) and (Collision[3]==1))
                or ((Collision[0]==0) and (Collision[1]==0) and (Collision[2]==0) and (Collision[3]==0))):
                    print('前3球正常')
                elif(Collision[0]==0) and (Collision[1]==1) and (Collision[2]==1) and (Collision[3]==1):
                    print('繼續')
                    
                else:
                    Leftpoint += 1
            #還沒處理發球得分之狀況
            if(count > 3):               #後面
                if(((Collision2[0]==0) and (Collision2[1]==0) and (Collision2[2]==0) and (Collision2[3]==0)) or ((Collision2[0]==1) and (Collision2[1]==0) and (Collision2[2]==0) and (Collision2[3]==0))
                or ((Collision2[0]==1) and (Collision2[1]==0) and (Collision2[2]==0) and (Collision2[3]==1)) or ((Collision2[0]==1) and (Collision2[1]==1) and (Collision2[2]==0) and (Collision2[3]==1))):
                    print('繼續')
                elif(Collision2[0]==1) and (Collision2[1]==1) and (Collision2[2]==1) and (Collision2[3]==1):
                    Collision2[0]=0
                    Collision2[1]=0
                    Collision2[2]=0
                    Collision2[3]=0
                    break
                elif(Collision2[0]==1) and (Collision2[1]==0) and (Collision2[2]==1) and (Collision2[3]==0):
                    Rightpoint += 1
                    Collision2[0]=0
                    Collision2[1]=0
                    Collision2[2]=0
                    Collision2[3]=0
                    break
                elif(Collision2[0]==1) and (Collision2[1]==1) and (Collision2[2]==0) and (Collision2[3]==2):
                    Leftpoint += 1
                    Collision2[0]=0
                    Collision2[1]=0
                    Collision2[2]=0
                    Collision2[3]=0
                    break

            cv2.putText(img, "{:d}:{:d}".format(Leftpoint, Rightpoint), (310, 30), cv2.FONT_HERSHEY_PLAIN, 1, (0, 255, 0), 2) 
            imgStack = np.hstack([img, imgOutput])
            cv2.imshow('Horizontal Stacking', imgStack)
            if cv2.waitKey(pulse_ms) & 0xFF == ord('q'):
                print("Quit\n")
                break
    else:
        while True:
            _, img = cap.read()

            imgHsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
            imgMask = cv2.inRange(imgHsv, lower, upper)
            imgOutput = cv2.bitwise_and(img, img, mask=imgMask)
            contours, hierarchy = cv2.findContours(imgMask, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_NONE)

            imgMask = cv2.cvtColor(imgMask, cv2.COLOR_GRAY2BGR)


            x, y, w, h = 0, 0, 0, 0

            if len(contours) != 0: 
                cnt = contours[0]
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
                
            cv2.putText(img, "({:0<2d}, {:0<2d})".format(targetPos_x, targetPos_y), (20, 30), cv2.FONT_HERSHEY_PLAIN, 1, (0, 255, 0), 2) 
            

            draw_direction(img, lastPos_x, lastPos_y, targetPos_x, targetPos_y)
            #----------------------
            #如果是左邊發球
            # timeout的問題(含發球那3顆)
            if(time.time() - start > 2):
                if((Collision2[0]==0) and (Collision2[1]==1) and (Collision2[2]==1) and (Collision2[3]==0)) or ((Collision2[0]==1) and (Collision2[1]==1) and (Collision2[2]==1) and (Collision2[3]==0)) or ((Collision2[0]==1) and (Collision2[1]==0) and (Collision2[2]==0) and (Collision2[3]==0)) or ((Collision2[0]==1) and (Collision2[1]==0) and (Collision2[2]==1) and (Collision2[3]==0)):
                    Rightpoint+=1
                    Collision2[0]=0
                    Collision2[1]=0
                    Collision2[2]=0
                    Collision2[3]=0
                    print("右加分")
                    break
                elif((Collision2[0]==0) and (Collision2[1]==1) and (Collision2[2]==0) and (Collision2[3]==0)) or ((Collision2[0]==0) and (Collision2[1]==0) and (Collision2[2]==0) and (Collision2[3]==0)):
                    Leftpoint+=1
                    Collision2[0]=0
                    Collision2[1]=0
                    Collision2[2]=0
                    Collision2[3]=0
                    print("左加分")
                    break
                    
            if(count <= 3 and count > 0):#前三球(含發球)
                if(((Collision[0]==0) and (Collision[1]==0) and (Collision[2]==0) and (Collision[3]==0)) or ((Collision[0]==1) and (Collision[1]==0) and (Collision[2]==0) and (Collision[3]==0))
                or ((Collision[0]==1) and (Collision[1]==0) and (Collision[2]==1) and (Collision[3]==0))):
                    print('前3球正常')
                elif(Collision[0]==1) and (Collision[1]==0) and (Collision[2]==1) and (Collision[3]==1):
                    print('繼續')
                else:
                    Rightpoint += 1
                    
            if(count > 3):               #後面
                if(((Collision2[0]==0) and (Collision2[1]==0) and (Collision2[2]==0) and (Collision2[3]==0)) or ((Collision2[0]==0) and (Collision2[1]==1) and (Collision2[2]==0) and (Collision2[3]==0))
                or ((Collision2[0]==0) and (Collision2[1]==1) and (Collision2[2]==1) and (Collision2[3]==0)) or ((Collision2[0]==1) and (Collision2[1]==1) and (Collision2[2]==1) and (Collision2[3]==0))):
                    print('繼續')
                elif(Collision2[0]==1) and (Collision2[1]==1) and (Collision2[2]==1) and (Collision2[3]==1):
                    Collision2[0]=0
                    Collision2[1]=0
                    Collision2[2]=0
                    Collision2[3]=0
                    break
                elif(Collision2[0]==1) and (Collision2[1]==1) and (Collision2[2]==2) and (Collision2[3]==0):
                    Rightpoint += 1
                    Collision2[0]=0
                    Collision2[1]=0
                    Collision2[2]=0
                    Collision2[3]=0
                    break
                elif(Collision2[0]==0) and (Collision2[1]==1) and (Collision2[2]==0) and (Collision2[3]==1):
                    Leftpoint += 1
                    Collision2[0]=0
                    Collision2[1]=0
                    Collision2[2]=0
                    Collision2[3]=0
                    break

            cv2.putText(img, "{:d} : {:d}".format(Leftpoint, Rightpoint), (310, 30), cv2.FONT_HERSHEY_PLAIN, 1, (0, 255, 0), 2) 
            imgStack = np.hstack([img, imgOutput])
            cv2.imshow('Horizontal Stacking', imgStack)
            if cv2.waitKey(pulse_ms) & 0xFF == ord('q'):
                print("Quit\n")
                break
        

cap.release()
cv2.destroyAllWindows()
