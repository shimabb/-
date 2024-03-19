def center(matrix):
    # ======================= x distance =======================
    L1=len(matrix[0])  
    X1=[]
    Y1=[]
    for i in range(L1):
        X1.append(matrix[0][i][0])
        Y1.append(matrix[0][i][1])
    X1_Kmean=sum(X1)/len(X1)
    Y1_Kmean=sum(Y1)/len(Y1)
    return([X1_Kmean,Y1_Kmean])

def distance(p1,p2,p3,p4,mapping):
    d1=[[],[]]
    d2=[[],[]]
    d3=[[],[]]
    d4=[[],[]]
    for i in mapping:
        dis1=(((p1[0]-i[0])**2)+((p1[1]-i[1])**2))**(1/2)
        dis2=(((p2[0]-i[0])**2)+((p2[1]-i[1])**2))**(1/2)
        dis3=(((p3[0]-i[0])**2)+((p3[1]-i[1])**2))**(1/2)
        dis4=(((p4[0]-i[0])**2)+((p4[1]-i[1])**2))**(1/2)
        buf=[dis1,dis2,dis3,dis4]
        tmp=min(buf)
        index = buf.index(tmp)
        if index==0:
            d1[0].append(i)
            d1[1].append(tmp)
        elif index==1:
            d2[0].append(i)
            d2[1].append(tmp)
        elif index==2:
            d3[0].append(i)
            d3[1].append(tmp)
        elif index==3:
            d4[0].append(i)
            d4[1].append(tmp)

    # print(d1,d2,d3,d4)  
    D=sum(d1[1]+d2[1]+d3[1]+d4[1])
    return(d1,d2,d3,d4,D)

## MAIN ##

mapping=[(2,5),(3,2),(3,3),(3,4),(4,3),(4,4),(6,3),(6,4),(6,6),(7,2),(7,5),(7,6),(7,7),(8,6),(8,7)]
L=len(mapping)
X=[]
Y=[]
for i in mapping:
    X.append(i[0])
    Y.append(i[1])
global_center_point=((max(X)+min(X))/2,(max(Y)+min(Y))/2)
p1=((max(X)+global_center_point[0])/2,(max(Y)+global_center_point[1])/2)
p2=((max(X)+global_center_point[0])/2,(min(Y)+global_center_point[1])/2)
p3=((min(X)+global_center_point[0])/2,(max(Y)+global_center_point[1])/2)
p4=((min(X)+global_center_point[0])/2,(min(Y)+global_center_point[1])/2)
print(p1,p2,p3,p4)

[d1,d2,d3,d4,D]=distance(p1,p2,p3,p4,mapping)
print('distance:',D/15,'\n')

decision=1
buf4=[]
count=0
while decision==1:
    p1=center(d1)
    p2=center(d2)
    p3=center(d3)
    p4=center(d4)
    [d1,d2,d3,d4,D]=distance(p1,p2,p3,p4,mapping)
    print(p1,p2,p3,p4)
    buf4.append(D/15)
    if count>0:
        if buf4[count]==buf4[count-1]:
            decision=0
    count+=1
print('minimum distance:',buf4[-1])