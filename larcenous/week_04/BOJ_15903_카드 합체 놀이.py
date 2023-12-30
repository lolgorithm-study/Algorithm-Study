from heapq import *
n, m = map(int,input().split())
num = list(map(int,input().split()))
heapify(num) #num 배열을 힙화한다.
for _ in range(m) :
    a = heappop(num)
    b = heappop(num)
    heappush(num, a+b)
    heappush(num, a+b)
print(sum(num))