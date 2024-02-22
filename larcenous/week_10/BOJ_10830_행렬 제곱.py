N, B = map(int,input().split())
A = [list(map(int,input().split())) for _ in range(N)]
def matmul(X,Y) :
    ans = [[0]*len(Y[0]) for _ in range(len(X))] #len(X) : 연산 결과 행렬의 행의 크기, len(Y[0]) : 연산 결과 행렬의 열의 크기
    for i in range(len(X)) :
        for j in range(len(Y[0])) :
            for k in range(len(X[0])) :
                ans[i][j] += X[i][k] * Y[k][j]
                ans[i][j] %= 1000
    return ans
def power(A, n) :
    if n == 1 :
        return A
    else :
        x = power(A, n//2)
        if n % 2 == 0 :
            return matmul(x,x)
        else :
            return matmul(matmul(x,x), A)
ans = power(A, B)
for row in ans :
    print(*[num%1000 for num in row])