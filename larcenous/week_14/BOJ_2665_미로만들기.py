#visited를 사용하지 않은 경우
from heapq import *
import sys
input = sys.stdin.readline
n = int(input())
graph = [list(input().rstrip()) for _ in range(n)]
def Dijkstra(start : tuple, end, graph, n) :
    INF = sys.maxsize
    D = [[INF]*n for _ in range(n)]
    D[start[0]][start[1]]=0
    q = [(0,(start))]
    dx, dy = [1,0,-1,0],[0,1,0,-1]
    while q :
        black, ind = heappop(q)
        if ind == end :
            return black
        y,x = ind
        for ddx,ddy in zip(dx,dy) :
            nx, ny = x+ddx, y+ddy
            if 0<=nx<n and 0<=ny<n :
                cost = 0
                if int(graph[ny][nx]) == 0 :
                    cost = 1
                cum_sum = black + cost
                if cum_sum < D[ny][nx] :
                    D[ny][nx] = cum_sum
                    heappush(q,(cum_sum,(ny,nx)))

print(Dijkstra((0,0),(n-1,n-1),graph,n))

'''
#visited를 사용한 경우 : 시간이 동일..
from heapq import *
import sys
input = sys.stdin.readline
n = int(input())
graph = [list(input().rstrip()) for _ in range(n)]
def Dijkstra(start : tuple, end, graph, n) :
    INF = sys.maxsize
    D = [[INF]*n for _ in range(n)]
    D[start[0]][start[1]]=0
    q = [(0,(start))]
    visited = set()
    dx, dy = [1,0,-1,0],[0,1,0,-1]
    while q :
        black, ind = heappop(q)
        if ind not in visited :
            visited.add(ind)
            if ind == end :
                return black
            y,x = ind
            for ddx,ddy in zip(dx,dy) :
                nx, ny = x+ddx, y+ddy
                if (ny,nx) in visited :
                    continue
                if 0<=nx<n and 0<=ny<n :
                    cost = 0
                    if int(graph[ny][nx]) == 0 :
                        cost = 1
                    cum_sum = black + cost
                    if cum_sum < D[ny][nx] :
                        D[ny][nx] = cum_sum
                        heappush(q,(cum_sum,(ny,nx)))

print(Dijkstra((0,0),(n-1,n-1),graph,n))
'''