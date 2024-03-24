from collections import deque
import sys
input = sys.stdin.readline

N = int(input().rstrip())
M = int(input().rstrip())
graph = [[] for _ in range(N+1)]
visited = [False]*(N+1)

for _ in range(M) :
    i,j = map(int,input().split())
    graph[i].append(j)
    graph[j].append(i)

def BFS(v) :
    q = deque([v])
    visited[v] = True
    while q :
        n = q.popleft()
        for next in graph[n] :
            if not visited[next] :
                visited[next] = True
                q.append(next)

BFS(1)
print(sum(visited[1:])-1)