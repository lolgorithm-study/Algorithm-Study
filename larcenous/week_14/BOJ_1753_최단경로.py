#heapq 사용
import sys
from heapq import * #우선순위큐로 heap을 사용
input = sys.stdin.readline

V,E = map(int,input().split())
K = int(input().rstrip())
inf = sys.maxsize #거리 초기화를 위한 inf값 설정
graph = [[] for _ in range(V+1)]
for _ in range(E) :
    u,v,w = map(int,input().split())
    graph[u].append((w,v)) #인접 리스트로 그래프 구성 
    #거리 순으로 정렬을 해야하므로, 가중치(거리)를 튜플의 첫번째 원소로 변경 
    #(v,w) -> (w,v)

visited = [False] * (V+1) #방문 여부

D = [inf] * (V+1) #최단거리 리스트
D[K] = 0 #시작노드로의 최단 거리는 0으로 설정

def dijkstra(graph, D, visited, V) :
    min_heap = []
    '''
    #가장 잛은 거리를 가지는 노드를 찾기 위해 모든 노드를 순회
    for i in range(1,V+1) :
        m = -1
        minimum = sys.maxsize
        for j in range(1,V+1) :
            if not visited[j] and D[j] < minimum :
                minimum = D[j]
                m = j
    '''
    heappush(min_heap,(0,K))
    while min_heap : 
        dist, current = heappop(min_heap)
        if visited[current] :
            continue #이미 방문했다면 처음으로 돌아가 최솟값을 다시 pop
        visited[current] = True

        for cost, destination in graph[current] :
            if not visited[destination] :
                if D[current] + cost < D[destination] : #m을 거쳐서 지나가는 경로가 더 짧다면 갱신
                    D[destination] = D[current] + cost
                    heappush(min_heap, (D[destination], destination)) #최소 힙에 (거리, 목적지) 추가

dijkstra(graph, D, visited, V)
for i in range(1,V+1) :
    if D[i] == inf :
        print('INF')
    else :
        print(D[i])