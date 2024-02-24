import sys
input = sys.stdin.readline

K, N = map(int, input().split())
cm = [int(input().rstrip()) for _ in range(K)]

min_len = 1
max_len = max(cm)

while min_len <= max_len :
    avg = (min_len + max_len)//2
    Sum = sum(cm[i]//avg for i in range(K))
    if Sum >= N :
        min_len = avg + 1
    else :
        max_len = avg - 1

print(max_len)