from collections import deque
N, K = map(int,input().split())
time = [-1]*(100001)
def BFS(N,K) :
    q = deque([N])
    t = 0
    time[N] = (0,N)
    if N == K :
        return time[N][1], time[N][0]
    while q :
        for _ in range(len(q)) :
            current = q.popleft()
            dx=[current+1,current-1,current*2]
            for x in dx :
                if 0<=x<=100000 and time[x]==-1:
                    time[x] = (t+1,current)
                    q.append(x)
                    if x == K :
                        return x, t+1
        t += 1

def Backtracking(end,t) :
    res = [end]
    while t != 0 : 
        end = time[end][-1]
        res.append(end)
        t -= 1
    return res[::-1]

end, t = BFS(N,K)
print(t)
print(*Backtracking(end,t))