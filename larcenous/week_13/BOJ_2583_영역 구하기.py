from collections import deque
M, N, K = map(int,input().split()) #M이 열, N이 행
visited = [[False]*M for _ in range(N)]
cnt = 0
ans = []

def BFS(x,y) :
    visited[y][x] = True
    q = deque([(x,y)])
    dx,dy = [1,0,-1,0],[0,1,0,-1]
    area = 1
    while q :
        cx,cy = q.popleft()
        for ddx,ddy in zip(dx,dy) :
            nx, ny = cx+ddx, cy+ddy
            if 0<=nx<M and 0<=ny<N :
                visited[ny][nx] = True
                q.append((nx,ny))
                area += 1
    return area

for _ in range(K) :
    x,y,x_,y_ = map(int,input().split()) #x가 열
    for i in range(x,x_+1) :
        for j in range(y,y_+1) :
            print(j,i)
            visited[j][i] = True
print(visited)
for i in range(M) :
    for j in range(N) :
        if not visited[j][i] :
            cnt += 1
            ans.append(BFS(i,j))
print(cnt)
print(*ans)
