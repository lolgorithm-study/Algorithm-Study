from heapq import *
from collections import *
import sys
input = sys.stdin.readline
INF = sys.maxsize #무한대로 사용
N, M = map(int,input().split())
A = list(map(int,input().split()))
'''
graph = [[INF]*N for _ in range(N)] 
부분에서 N x N 크기의 2차원 리스트를 사용하여 그래프를 표현하고 있습니다. 
각 노드 간의 모든 연결 정보를 저장하는 방식이기 때문에 
노드의 수(N)에 따라 메모리 사용량이 제곱으로 증가합니다.
만약 노드의 수가 많고 간선이 상대적으로 적은 희소 그래프(sparse graph)인 경우,
메모리 낭비가 심할 수 있습니다.
'''
graph = defaultdict(list) #메모리 관리를 위해 dictionary를 사용
for _ in range(M) :
    a,b,t = map(int,input().split())
    graph[a].append((t,b))
    graph[b].append((t,a))

def Dijkstra(start,graph,end) :
    q = [(0,start)]
    visited = set() #방문여부를 set으로 관리
    D = [INF]*N
    D[start] = 0
    while q :
        cost,current = heappop(q)
        if current not in visited : #방문여부 판별
            visited.add(current)
            if current == end :
                return cost
            for edge_weight, next in graph.get(current,()) :
                if next in visited or (A[next] == 1 and next != end) : #시야가 밝혀진 곳은 경로로 사용 불가
                    continue
                cum_cost = cost + edge_weight
                if cum_cost < D[next] :
                    D[next] = cum_cost
                    heappush(q,(cum_cost,next))
    return -1

print(Dijkstra(0,graph,N-1))