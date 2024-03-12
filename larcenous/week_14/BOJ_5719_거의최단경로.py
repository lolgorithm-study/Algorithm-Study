import sys
from heapq import *
from collections import *
#input = sys.stdin.readline

def Dijkstra(start,end,graph,N,shortest_path=None) :
    INF = sys.maxsize
    q = [(0,start,())]
    visited = set()
    if shortest_path != None :
        visited = set(shortest_path).difference({start,end})
    D = [INF]*N
    while q :
        cost, current, path = heappop(q)
        if current not in visited :
            visited.add(current)
            if current == end :
                return (cost,path)
            for edge_weight, next in graph.get(current,()):
                if next in visited :
                    continue
                cum_cost = cost + edge_weight
                if cum_cost < D[next] :
                    D[next] = cum_cost
                    path = (path, next)
                    heappush(q, (cum_cost,next,path))
    return -1

while True :
    N, M = map(int,input().split())
    if N == 0 and M == 0 :
        break
    S, D = map(int,input().split())
    graph = defaultdict(list)
    for _ in range(M) :
        U, V, P = map(int,input().split())
        graph[U].append((P,V))
    cost, path = Dijkstra(S,D,graph,N)
    print(Dijkstra(S,D,graph,N,path)[0])