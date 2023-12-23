from collections import deque
import sys
input = sys.stdin.readline
T = int(input().rstrip())
for _ in range(T) :
    N = int(input().rstrip)
    card = input().rstrip().split()
    q = deque([])
    for c in card :
        ql, qr = q.copy(), q.copy() #q를 복사하여 ql, qr을 생성
        ql.appendleft(c) #ql에는 왼쪽에 card를 붙인 경우
        qr.append(c) #qr에는 오른쪽에 card를 붙인 경우를 저장
        q = min(ql, qr) #둘 중 작은 값을 q로 재정의
        #문자열의 경우 아스키코드로 크기 비교가 가능
        #아스키코드는 사전 순(오름차순)으로 할당되어있다
    print(''.join(q))