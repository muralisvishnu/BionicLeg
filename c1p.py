hip=[49, 49, 49, 48, 48, 48, 48, 48, 48,48, 48, 48, 47, 47, 46, 46, 45, 44, 43, 42, 41, 40, 39, 38, 37, 35, 34, 33, 31, 30, 28, 27, 25, 23, 22, 20, 19, 17, 16, 15, 14, 12, 11, 10, 9, 8, 7, 6, 5, 5, 4, 4, 3, 3, 2, 2, 2, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 9, 11, 13, 14, 16, 18, 21, 23, 25, 27, 30, 32, 34, 36, 38, 39, 41, 42, 43, 45, 46, 47, 47, 48, 48, 48, 49, 49, 49, 49, 49]
knee=[ 8, 6, 5, 4, 3, 2, 2, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 15, 16, 16, 15, 15, 14, 13, 12, 11, 10, 9, 8, 7, 5, 4, 3, 2, 1, 1, 0, 0, 0, -1, -1, -1, -1, 0, 0, 0, 1, 2, 3, 3, 4, 5, 7, 8, 9, 11, 12, 14, 16, 18, 20, 22, 24, 26, 28, 31, 33, 36, 38, 40, 42, 44, 46, 47, 47, 48, 48, 48, 47, 47, 46, 45, 44, 42, 41, 39, 37, 34, 31, 28, 25, 21, 18, 15, 12, 10]
ankle=[45, 46, 46, 46, 46, 45, 45, 44, 42, 40, 39, 38, 37, 36, 36, 35, 35, 35, 35, 36, 36, 37, 38, 39, 39, 40, 40, 41, 41, 42, 42, 42, 42, 42, 43, 43, 43, 43, 44, 44, 44, 44, 45, 45, 46, 46, 46, 47, 47, 47, 47, 47, 47, 46, 46, 45, 44, 42, 40, 37, 35, 32, 28, 26, 23, 21, 19, 18, 17, 16, 16, 16, 17, 18, 20, 21, 23, 25, 26, 28, 30, 31, 32, 34, 35, 36, 37, 38, 39, 40, 40, 41, 42, 42, 43, 43, 44, 44, 45, 45]
kneetest=[]
kneetest2=[]

import matplotlib.pyplot as plt

#plt.plot(range(100),hip)
plt.plot(range(100),knee)
plt.show()

hist=[]
stepf=[21,23,25,27,30,32,34,36]
stepb=[20,22,23,25,27,28,30,31]
indexX=0
indexY=0
print(hip[50],hip[56],hip[57],hip[58])
n=int(input("Enter input hip"))
def f1():                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    if (n in hip[0:58]):
        indexX=hip.index(n)
    elif(n-1 in hip[0:58]):
        indexX=hip.index(n-1)
    elif(n-2 in hip[0:58]):
        indexX=hip.index(n-2)
    else:
        indexX=hip.index(n-3)


    if(n in hip[50:]):
        indexY=hip.index(n,58,100)
    elif(n+1 in hip[50:]):
        indexY=hip.index(n+1,58,100)
    elif(n+2 in hip[50:]):
        indexY=hip.index(n+2,58,100)
    else:
        indexY=hip.index(n+3,58,100)
    return(indexX,indexY)


# indexY=hip.index(n,45,100)
indexX,indexY=f1()
print(f1())
print(indexX,indexY)

if(n>=stepf[0]):
    for i in range(len(stepf)):
        hist.append(hip.index(stepf[i],50,100))
    hist.insert(0,indexY)
    hist.pop()
    
elif(n<=stepb[0]):
    for i in range(len(stepf)):
        hist.append(hip.index(stepb[i]))
    hist.insert(0,indexX)
    hist.pop()
# print(knee[index],ankle[index])
print(hist)

while 1:
    n=int(input("enter input"))
    if (n>=49):
        n=49
    indexX,indexY=f1()
    index=0
    print("x=",indexX , " y=",indexY)
    if(hist[0]>=56 and n<=2):
        if(abs(hist[0]-indexX)<abs(hist[0]-indexY)):
            index=indexY
            index=index%95
            hist.insert(0,index)
            hist.pop()
        elif(abs(hist[0]-indexX)>abs(hist[0]-indexY)):
            index=indexX
            index=index%95
            hist.insert(0,index)
            hist.pop()

    else:
        if(abs(hist[0]-indexX)<abs(hist[0]-indexY)):
            index=indexX
            index=index%95
            hist.insert(0,index)
            hist.pop()
        elif(abs(hist[0]-indexX)>abs(hist[0]-indexY)):
            index=indexY
            index=index%95
            hist.insert(0,index)
            hist.pop()
    print(hist)
    print(ankle[index])
    print(index)




