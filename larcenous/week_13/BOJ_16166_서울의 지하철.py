from collections import deque
import sys
input = sys.stdin.readline
N = int(input().strip())
line = dict()
visited = dict()

for i in range(1,N+1) :
    K, *station = map(int,input().strip().split())
    line[i] = set(station)

def BFS(start, end) :
    cnt = 0
    if end in line[start] :
        return cnt
    visited[start] = True
    q = deque([start])
    while q :
        for _ in range(len(q)) :
            cl = q.popleft() #current line
            for i in line[cl] :
                for j in line.keys() :
                    if not visited[j] :
                        if i in line[j] :
                            if end in line[j] :
                                return cnt + 1
                            visited[j] = True
                            q.append(j)
        cnt += 1
    return -1

end = int(input().strip())
cnt = sys.maxsize
for i in range(1,N+1) :
    if 0 in line[i] :
        for j in range(1,N+1) :
            visited[j] = False
        cnt = min(cnt,BFS(i,end))
print(cnt)