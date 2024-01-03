#현재 위치 - 각 동생의 위치의 gcd가 가능한 D의 최댓값이 된다.
import math
N, S = map(int,input().split())
def cal(num) :
    return abs(S-num)
A = list(map(cal,map(int,input().split())))
print(math.gcd(*A))

'''
#내장함수 미사용
N, S = map(int,input().split())
def cal(num) :
    return abs(S-num)
def GCD(A,B) :
    if B == 0 :
        return A
    else :
        return GCD(B,A%B)
A = list(map(cal,map(int,input().split())))
gcd = A[0]
for a in A :
    gcd = GCD(gcd,a) 
print(gcd)
'''