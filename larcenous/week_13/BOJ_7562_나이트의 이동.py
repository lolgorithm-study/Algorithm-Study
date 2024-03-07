import sys
from collections import deque
input = sys.stdin.readline
def BFS(x,y,night_x,night_y) :
    cnt = 0
    visited[y][x] = True
    queue = deque([(x,y)])
    dx, dy = [1,1,2,2,-1,-1,-2,-2],[2,-2,1,-1,2,-2,1,-1]
    while queue :
        for _ in range(len(queue)) :
            x,y = queue.popleft()
            for ddx, ddy in zip(dx,dy) :
                nx, ny = x+ddx, y+ddy
                if 0 <= nx < L and 0 <= ny < L :
                    if not visited[ny][nx] :
                        if not (ny == night_y and nx == night_x) :
                            visited[ny][nx] = True
                            queue.append((nx,ny))
                        else :
                            return cnt+1
        cnt += 1

N = int(input())
for _ in range(N) :
    L = int(input().strip())
    visited = [[False]*L for _ in range(L)]
    nx, ny = map(int,input().strip().split())
    x, y = map(int,input().strip().split())
    if x==nx and y==ny :
        print(0)
    else :
        print(BFS(x,y,nx,ny))