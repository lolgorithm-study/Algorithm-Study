import sys
from heapq import *
from collections import *
input = sys.stdin.readline

def Dijkstra(start,end,graph,N) :
    minload = [[] for _ in range(N)]
    INF = sys.maxsize
    q = [(0,start)]
    visited = set()
    D = [INF]*N
    while q :
        cost, current = heappop(q)
        if current not in visited :
            visited.add(current)
            if current == end :
                return cost, minload
            for edge_weight, next in graph.get(current,()):
                if next in visited :
                    continue
                cum_cost = cost + edge_weight
                if cum_cost < D[next] :
                    D[next] = cum_cost
                    minload[next].clear()
                    minload[next].append(current) #최단 경로를 역방향으로 생성
                    heappush(q, (cum_cost,next))
                #최단 경로가 두 개 이상 존재할 수 있음
                elif cum_cost == D[next] : 
                    minload[next].append(current)
    return -1, minload #minload가 아닌 []로 했다가 BFS를 돌리는 과정에서 IndexError가 발생

def BFS(start, graph, minload) : #최단 경로를 역추적하며, 가중치를 무한대로 변경하여 사용할 수 없게 만듬
    INF = sys.maxsize
    q = deque([start])
    visited = set([start])
    while q :
        current = q.popleft()
        for next in minload[current] :
            if next not in visited:
                q.append(next)
                visited.add(next)
            for i in range(len(graph[next])) :
                if graph[next][i][1] == current :
                    graph[next][i][0] = INF
    return graph

while True :
    N, M = map(int,input().split())
    if N == 0 and M == 0 :
        break
    S, D = map(int,input().split())
    graph = defaultdict(list)
    for _ in range(M) :
        U, V, P = map(int,input().split())
        graph[U].append([P,V])
    cost, minload = Dijkstra(S,D,graph,N)
    graph = BFS(D, graph, minload)
    cost, minload = Dijkstra(S,D,graph,N)
    print(cost)