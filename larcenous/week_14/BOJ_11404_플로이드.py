import sys
INF = sys.maxsize
input = sys.stdin.readline

n = int(input())
m = int(input())
D = [[INF]*(n+1) for _ in range(n+1)]
for i in range(1,n+1) :
    D[i][i] = 0
for _ in range(m) :
    a, b, c = map(int,input().split())
    D[a][b] = min(D[a][b],c)

def Floyd_Warshall(D) :
    for i in range(1,n+1) :
        for j in range(1,n+1) :
            for k in range(1, n+1) :
                D[j][k] = min(D[j][k], D[j][i] + D[i][k])
    
    '''음수 사이클 확인
    for i in range(1,n+1) :
        if D[i][i] < 0 :
            return -1
    '''

    for i in range(1,n+1) :
        for j in range(1,n+1) :
            if D[i][j] == INF :
                D[i][j] = 0 #도달할 수 없는 경우 0을 출력
    
    return D

D = Floyd_Warshall(D)
for i in range(1,n+1) :
    print(* D[i][1:])