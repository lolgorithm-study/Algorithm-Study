import sys
from collections import deque
input = sys.stdin.readline

T = int(input().rstrip())

def BFS(start_x, start_y) :
    queue = deque()
    queue.append((start_x, start_y))
    
    while queue :
        ex,ey = queue.popleft()
        for dx,dy in zip([1,0,-1,0],[0,1,0,-1]) :
            nx = ex + dx
            ny = ey + dy
            if 0<=ny<N and 0<=nx<M :
                if not visit[ny][nx] and land[ny][nx] == 1:
                    queue.append((nx,ny))
                    visit[ny][nx] = True

for _ in range(T) :
    M,N,K = map(int,input().rstrip().split())
    land = [[0]*M for _ in range(N)]
    visit = [[False]*M for _ in range(N)]

    for _ in range(K) :
        X,Y = map(int,input().rstrip().split())
        land[Y][X] = 1
    
    count = 0
    for i in range(M) :
        for j in range(N) :
            if  land[j][i] == 1 and not visit[j][i] :
                visit[j][i] = True
                BFS(i,j)
                count += 1
    print(count)