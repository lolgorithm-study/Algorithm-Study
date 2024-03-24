import sys
from heapq import *
from collections import *
input = sys.stdin.readline
N, M, K, X = map(int,input().split())
graph = defaultdict(list)
for _ in range(M) :
    A, B = map(int,input().split())
    graph[A].append([1,B])

def Dijkstra(start,graph,K) :
    INF = sys.maxsize
    ans = []
    D = [INF]*(N+1)
    visited = set()
    q = [(0,start)] #cost, node
    while q :
        cost, current = heappop(q)
        if current not in visited :
            visited.add(current)
            for weight, next in graph[current] :
                if next in visited :
                    continue
                cum_cost = cost + weight
                if cum_cost < D[next] :
                    D[next] = cum_cost
                    heappush(q,(cum_cost,next))
    for i in range(len(D)) :
        if D[i] == K :
            ans.append(i)

    return ans

ans = Dijkstra(X,graph,K)
if ans == [] :
    print(-1)
else :
    print(*ans, sep='\n')