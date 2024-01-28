#Top-down
from math import pi
memo = dict()
memo[0] = memo[1] = memo[2] = memo[3] = memo[pi] = 1
def pibonacci(num) :
    if num <= pi : #0부터 pi까지의 연속적인 수에 대해 기저 상태를 정의
        return 1
    elif num in memo.keys() :
        return memo[num]
    else :
        memo[num] = (pibonacci(num-1) + pibonacci(num-pi))%1000000000000000000
        return memo[num]

print(pibonacci(int(input())))