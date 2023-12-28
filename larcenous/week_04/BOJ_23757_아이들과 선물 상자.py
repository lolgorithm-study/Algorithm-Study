from heapq import *
N, M = map(int,input().split())
c = list(map(int,input().split()))
w = list(map(int,input().split()))

pq = [] #priority queue
res = True #마지막 출력을 결정하는 변수
for num in c :
    heappush(pq, -num) #최대 힙을 구현하기 위해 음수로 저장
for num in w :
    tmp = -heappop(pq)
    if tmp < num : #개수가 부족해 아이를 만족시키지 못한다면,
        res = False
        break
    tmp -= num
    heappush(pq, -tmp)
if res :
    print(1)
else :
    print(0)