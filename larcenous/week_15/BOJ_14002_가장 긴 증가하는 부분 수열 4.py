N = int(input())
A = list(map(int,input().split()))

DP = [1 for _ in range(N)]

for i in range(N):
    for j in range(i):
        if A[i] > A[j]:
            DP[i] = max(DP[i], DP[j]+1)

max_len = max(DP)
print(max_len)
max_idx = DP.index(max_len)
LIS = []

while max_idx >= 0 : #거꾸로 순회
    if DP[max_idx] == max_len :
        LIS.append(A[max_idx])
        max_len -= 1
    max_idx -= 1

LIS.reverse()
print(*LIS)