'''
다솜이는 기호 1번이다.
예제가 많아서 한 번에 풀었다. 
예제가 없었다면 틀렸을 것 같다. 
ex) 후보자가 다솜이 한 명인 경우
'''
from heapq import *
import sys
input = sys.stdin.readline
N = int(input().rstrip())
hq = []
for i in range(N) :
    if i+1 == 1 : #다솜이의 점수만 따로 저장
        dasom_score = int(input().rstrip())
        continue
    heappush(hq, (-int(input().rstrip()),i+1))
cnt = 0
if len(hq) != 0 : #만약 다솜이를 제외한 후보자가 있다면, 
    while -hq[0][0] >= dasom_score :
        polling_score, candidate_num = heappop(hq) 
        polling_score = -polling_score -1
        dasom_score += 1
        cnt += 1
        heappush(hq ,(-polling_score, candidate_num))
print(cnt)