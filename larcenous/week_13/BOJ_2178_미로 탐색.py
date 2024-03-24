from collections import deque
import sys
input = sys.stdin.readline

N, M = map(int,input().split())
maze = [[] for _ in range(N)]
visited = [[False]*M for _ in range(N)]
for i in range(N) :
    maze[i] = input().rstrip()

#최소의 이동 거리로 도착위치로 이동해야 하므로, BFS를 통해 level로 이동 횟수를 계산
def BFS(i,j) : 
    q = deque([(i,j)])
    visited[j][i] = True
    dx,dy = [1,0,-1,0],[0,1,0,-1]
    cnt = 1
    while q :
        for _ in range(len(q)) :
            x,y = q.popleft()
            for ddx,ddy in zip(dx,dy) :
                nx,ny = x+ddx,y+ddy
                if -1<nx<M and -1<ny<N :
                    if not visited[ny][nx] and maze[ny][nx] == '1' :
                        if ny == N-1 and nx == M-1 :
                            return cnt + 1
                        visited[ny][nx] = True
                        q.append((nx,ny))
        cnt += 1

print(BFS(0,0))
