N = int(input())
A = list(map(int,input().split()))
maximum = 0
def search(depth) :
    if depth == N :
        result.append(sum(abs(explore[i] - explore[i+1]) for i in range(N-1)))
    for i in range(N) :
        if visited[i] :
            continue
        visited[i] = True
        explore.append(A[i])
        search(depth+1)
        explore.pop()
        visited[i] = False

visited = [False] * N
result, explore = [], []
search(0)
print(max(result))

'''
from itertools import permutations
N = int(input())
A = list(map(int,input().split()))
maximum = 0
def cal(li) :
    res = 0
    for i in range(N-1) :
        res += abs(li[i]-li[i+1])
    return res

for case in permutations(A) :
    maximum = max(maximum,cal(case))
print(maximum)
'''