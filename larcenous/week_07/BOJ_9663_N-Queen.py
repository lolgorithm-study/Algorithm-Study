N = int(input())
ans = 0

def is_promising(row) :
    for i in range(row) :
        if visit[i] == visit[row] or abs(row-i) == abs(visit[row] - visit[i]) :
            return False
    return True

def backtrack(row) :
    global ans
    if row == N :
        ans += 1
        return
    else :
        for col in range(N) :
            visit[row] = col
            if is_promising(row) :
                backtrack(row+1)

visit = [0 for i in range(N)]
backtrack(0)
print(ans)