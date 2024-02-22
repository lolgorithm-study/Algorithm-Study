N = int(input())
li = [int(input()) for _ in range(N)]
ans = []
li.sort()
for rope in li :
    ans.append(rope*N)
    N -= 1
print(max(ans))