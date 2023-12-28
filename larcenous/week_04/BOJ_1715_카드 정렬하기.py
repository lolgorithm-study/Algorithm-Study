'''
파일 합치기 3과 유사한 문제
'''
import sys
from heapq import *
input = sys.stdin.readline
N = int(input().rstrip())
ans = 0
num = [int(input().rstrip()) for _ in range(N)]
heapify(num)
while len(num) > 1 :
    a = heappop(num)
    b = heappop(num)
    c = a+b
    ans += c
    heappush(num, c)
print(ans)