import sys
input = sys.stdin.readline
sys.setrecursionlimit(10**9) #Maximum recursion depth exceed
n = int(input().rstrip())
adj_matrix = [[] for _ in range(n+1)]

for _ in range(n-1) :
    i, j, weight = map(int,input().rstrip().split())
    adj_matrix[i].append((j,weight))
    adj_matrix[j].append((i,weight))

def DFS(start,dist) :
    visited[start] = True
    for next,weight in adj_matrix[start] :
        if visited[next] == False :
            distance[next] = dist + weight
            DFS(next,dist+weight)

visited = [False]*(n+1)
distance = [-1]*(n+1)
distance[1] = 0 #없으니 틀린다고.. edge case가 뭘까? -> n이 1인 경우 0을 출력해야함
DFS(1,0)

start = distance.index(max(distance))

visited = [False]*(n+1)
distance = [-1]*(n+1)
distance[start] = 0
DFS(start,0)

print(max(distance))