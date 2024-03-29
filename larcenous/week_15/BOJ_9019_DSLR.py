'''
회전한다는 말에 deque를 쓰면 시간초과가 나기 쉽다
'''
import sys
from collections import deque
input = sys.stdin.readline
T = int(input())
def BFS(A,B) :
    visited = [False]*10001
    q = deque([(A,'')])
    visited[A] = True
    while q :
        for _ in range(len(q)) :
            now = q.popleft()
            now_d, now_ins = now[0], now[1]
            if  now_d == B :
                return now_ins
            tmp = (2*now_d)%10000
            if not visited[tmp] :
                visited[tmp] = True
                q.append((tmp,now_ins+'D'))

            tmp = (now_d-1)%10000
            if not visited[tmp] :
                visited[tmp] = True
                q.append((tmp,now_ins+'S'))

            tmp = now_d // 1000 + (now_d%1000)*10
            if not visited[tmp] :
                visited[tmp] = True
                q.append((tmp,now_ins+'L'))

            tmp = now_d // 10 + (now_d%10)*1000
            if not visited[tmp] :
                visited[tmp] = True
                q.append((tmp,now_ins+'R'))

for _ in range(T) :
    A,B = map(int,input().split())
    print(*BFS(A,B),sep='')