N = int(input())
paper = [list(map(int,input().split())) for _ in range(N)]
#하양 0, 파랑 1
def DFS(x,y,k) :
    w,b = 0,0
    color = paper[y][x]
    for i in range(y,y+k) :
        for j in range(x,x+k) :
            if color != paper[i][j] :
                color = -1
                break 
    if color == -1 :
        #사분면으로 나누어 각 사분면에 대해 탐색을 진행
        k = k//2
        w1,b1 = DFS(x,y,k) 
        w2,b2 = DFS(x,y+k,k)
        w3,b3 = DFS(x+k,y,k)
        w4,b4 = DFS(x+k,y+k,k)
        w = w + w1 + w2 + w3 + w4 #하위 문제에서의 탐색결과를 merge
        b = b + b1 + b2 + b3 + b4
    elif color == 1 :
        b += 1
    else :
        w += 1
    return w,b #merge한 값을 return
w,b = DFS(0,0,N)
print(w)
print(b)