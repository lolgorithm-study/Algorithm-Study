A, B = map(int,input().split())
M = 1000000007
def mul(Num,n) :
    if n == 1 :
        return Num
    else :
        x = mul(Num,n//2)
        if n%2 == 0 :
            return (x*x)%M
        else :
            return (x*x*Num)%M
        
# 등비수열의 합 공식 사용
if A == 1 :
    print(B%M)
else :
    print((((mul(A,B)-1)%M)*(mul(A-1,M-2)%M))%M)