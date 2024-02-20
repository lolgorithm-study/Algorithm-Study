def matmul(X,Y) :
    ans = [[0]*len(Y[0]) for _ in range(len(X))]
    for i in range(len(X)) :
        for j in range(len(Y[0])) :
            for k in range(len(X[0])) :
                ans[i][j] += X[i][k]*Y[k][j]
                ans[i][j] %= 1000000007
    return ans
n = int(input())
def power(A,n) :
    if n == 1 :
        return A
    else :
        x = power(A,n//2)
        if n%2 == 0 :
            return matmul(x,x)
        else :
            return matmul(A,matmul(x,x))
A = [[1,1],[1,0]]
fibo = matmul(power(A, n),[[1],[0]])
print(fibo[1][0]%1000000007)