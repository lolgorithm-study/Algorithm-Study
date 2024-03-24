import sys
input = sys.stdin.readline
INF = sys.maxsize
N, M = map(int,input().split())
graph = [[] for _ in range(N+1)]
for _ in range(M) :
    A,B,C = map(int,input().split())
    graph[A].append((B,C))

def Bellman_Ford(start, graph) :
    D = [INF]*(N+1)
    D[start] = 0
    for _ in range(N-1) : #가중치 갱신을 (노드 수 -1)회 수행
        for i in range(1,N+1) :
            if D[i] != INF : #INF가 아닌 경우, 즉 현재 노드에 도달할 수 있는 경우
                for next, cost in graph[i] : #graph[i]가 비어있는 경우 반복문이 스킵
                    #print(i, next, cost)
                    if D[i] + cost < D[next] :
                        #print('갱신', D[i] + cost)
                        D[next] = D[i] + cost
    #print(D)
    for i in range(1,N+1) :
        if D[i] != INF : #INF가 아닌 경우, 즉 현재 노드에 도달할 수 있는 경우
            for next, cost in graph[i] :
                if D[i] + cost < D[next] :#만약 if D[i] != INF 가 없다면, 도달할 수 없는 노드가 존재하는 경우 -1이 반환됨
                    return -1
    #print(D)
    for i in range(1,N+1) :
        if D[i] == INF :
            D[i] = -1
    #print(D)
    return D

ans = Bellman_Ford(1, graph)
if ans == -1 :
    print(ans)
else :
    for i in range(2,N+1) :
        print(ans[i])