from collections import *
N = int(input())
def BFS(N) :
    q = deque([[N]])
    cnt = 0
    while q :
        for _ in range(len(q)) :
            path = q.popleft()
            x = path[-1]
            if x == 1 :
                return cnt, path
            if x%3 == 0 :
                q.append(path + [x//3])
            if x%2 == 0 :
                q.append(path + [x//2])
            q.append(path + [x-1])
        cnt += 1

cnt, path = BFS(N)
print(cnt)
print(*path)