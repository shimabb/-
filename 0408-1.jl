function distance(p1,p2,p3,p4,mapping)
    d1=[[],[]]
    d2=[[],[]]
    d3=[[],[]]
    d4=[[],[]]
    for i in mapping
        dis1=sqrt(((p1[1]-i[1])^2)+((p1[2]-i[2])^2))
        dis2=sqrt(((p2[1]-i[1])^2)+((p2[2]-i[2])^2))
        dis3=sqrt(((p3[1]-i[1])^2)+((p3[2]-i[2])^2))
        dis4=sqrt(((p4[1]-i[1])^2)+((p4[2]-i[2])^2))
        buf=[dis1,dis2,dis3,dis4]
        tmp=minimum(buf)
        index=findfirst(==(tmp),buf)
        if index==1
            push!(d1[1],i)
            push!(d1[2],tmp)
        elseif index==2
            push!(d2[1],i)
            push!(d2[2],tmp)
        elseif index==3
            push!(d3[1],i)
            push!(d3[2],tmp)
        elseif index==4
            push!(d4[1],i)
            push!(d4[2],tmp)
        end
    end

    D=sum(append!(d1[2],d2[2],d3[2],d4[2]))
    return(d1,d2,d3,d4,D)
end

function center(matrix)
    # ======================= x distance =======================
    L1=length(matrix[1])
    X1=[]
    Y1=[]
    for i in 1:L1
        push!(X1,matrix[1][i][1])
        push!(Y1,matrix[1][i][2])
    end
    X1_Kmean=sum(X1)/length(X1)
    Y1_Kmean=sum(Y1)/length(Y1)
    return([X1_Kmean,Y1_Kmean])
end
## MAIN ##

mapping=[(2,5),(3,2),(3,3),(3,4),(4,3),(4,4),(6,3),(6,4),(6,6),(7,2),(7,5),(7,6),(7,7),(8,6),(8,7)]
L=length(mapping)
println(L)
X=[]
Y=[]
for i in mapping
    push!(X,i[1])
    push!(Y,i[2])
end
global_center_point=((maximum(X)+minimum(X))/2,(maximum(Y)+minimum(Y))/2)
p1=((maximum(X)+global_center_point[1])/2,(maximum(Y)+global_center_point[2])/2)
p2=((maximum(X)+global_center_point[1])/2,(minimum(Y)+global_center_point[2])/2)
p3=((minimum(X)+global_center_point[1])/2,(maximum(Y)+global_center_point[2])/2)
p4=((minimum(X)+global_center_point[1])/2,(minimum(Y)+global_center_point[2])/2)
println(global_center_point,p1,p2,p3,p4)

(d1,d2,d3,d4,D)=distance(p1,p2,p3,p4,mapping)
println("distance:",D/15)
p1=center(d1)
p2=center(d2)
p3=center(d3)
p4=center(d4)
println(p1,p2,p3,p4)
(d1,d2,d3,d4,D)=distance(p1,p2,p3,p4,mapping)
println("minimum distance:",D/15)