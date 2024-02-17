A,B,C = map(int,input().split())
def mul(A,n) :
    if n == 1 :
        return A
    else :
        x = mul(A,n//2)
        if n % 2 == 0 :
            return (x*x)%C
        else :
            return (x*x*A)%C
print(mul(A,B)%C)