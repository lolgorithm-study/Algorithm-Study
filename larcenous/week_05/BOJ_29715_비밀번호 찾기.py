'''
math.perm을 이용하여 간소화 가능하다.
'''
from math import factorial
N, M = map(int,input().split())
X, Y = map(int,input().split())
num_list = [1,2,3,4,5,6,7,8,9]
nfix_num = []
fix_num = []
for _ in range(M) :
    a,b = map(int,input().split())
    if a == 0 :
        nfix_num.append(b)
    else :
        fix_num.append(b)
#fix_num을 제외한 남은 자리를 len(nfix_num) 만큼 배정
#남은 자리에 남은 숫자를 배열
num_try = factorial(N-len(fix_num))/factorial(N-len(fix_num)-len(nfix_num)) * factorial(9-len(fix_num)-len(nfix_num))/factorial(9-len(fix_num)-len(nfix_num)-(N-len(fix_num)-len(nfix_num)))
delay = num_try//3
if num_try%3 == 0 : #3번째에 맞추는 경우 Y만큼의 시간이 소요되지 않는다
    delay -= 1
print(int(num_try*X + delay * Y))