N, M = map(int,input().split())
A = [list(map(int,input().split())) for _ in range(N)]
M, K = map(int,input().split())
B = [list(map(int,input().split())) for _ in range(M)]

def matmul(X,Y) :
    ans = [[0]*len(Y[0]) for _ in range(len(X))]
    for i in range(len(X)) : #X의 행 순환
        for j in range(len(Y[0])) : #Y의 열 순환
            for k in range(len(X[0])) : #고정된 행,열에서 원소별 순회
                ans[i][j] += X[i][k]*Y[k][j]
    return ans
for row in matmul(A,B) :
    print(*row)