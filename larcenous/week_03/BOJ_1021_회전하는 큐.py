from collections import deque
N,M = map(int,input().split())
num = list(map(int,input().split()))[::-1]
q = deque([i for i in range(1,N+1)])

#어느 방향으로 돌려야 최소인지 계산하는 함수
def which_rotate(q, target) : 
    tmp = q.copy()
    rcnt = 0
    while True :
        if tmp[0] == target :
            break
        tmp.rotate(1)
        rcnt += 1
    tmp = q.copy()
    lcnt = 0
    while True :
        if tmp[0] == target :
            break
        tmp.rotate(-1)
        lcnt += 1
    if rcnt <= lcnt :
        return rcnt, 'right'
    else :
        return lcnt, 'left'
    
cnt = 0
while num : #num list가 비어있지 않으면 계속 반복
    target = num.pop()
    minimum, side = which_rotate(q, target)
    cnt += minimum
    if side == 'right' :
        q.rotate(minimum) #시계방향으로 minimum만큼 deque(원형큐)를 회전
        q.popleft()
    else :
        q.rotate(-minimum) #반시계방향으로 minimum만큼 회전
        q.popleft()
print(cnt)