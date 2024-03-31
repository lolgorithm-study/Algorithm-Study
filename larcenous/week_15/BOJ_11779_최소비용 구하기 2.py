import sys
from collections import defaultdict
import heapq

INF = sys.maxsize
input = sys.stdin.readline

n = int(input())
m = int(input())
graph = defaultdict(list)
#graph 구성
for _ in range(m):
    a, b, c = map(int, input().split())
    graph[a].append((b, c))
start, end = map(int, input().split())

dist = [INF] * (n+1)
prev_node = [0] * (n+1) #이전 노드값을 저장하여 역추적에 사용

def dijkstra(start): #start에서 각 노드로 향하는 최단거리 계산
    q = []
    heapq.heappush(q, (0, start))
    dist[start] = 0
    while q:
        weight, node = heapq.heappop(q)
        if dist[node] < weight:
            continue
        for adj_node, adj_weight in graph[node]:
            cost = weight + adj_weight
            if cost < dist[adj_node]:
                dist[adj_node] = cost
                prev_node[adj_node] = node
                heapq.heappush(q, (cost, adj_node))

dijkstra(start)
print(dist[end])

#역추적 진행
path = [end]
now = end
while now != start:
    now = prev_node[now]
    path.append(now)

print(len(path))
print(*path[::-1])