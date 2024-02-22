import sys
input = sys.stdin.readline
N, K = map(int,input().split())
li = list(reversed([int(input().rstrip())for _ in range(N)]))

count = 0
for i in range(N) :
    if K == 0 :
        break
    while True :
        if K - li[i] >= 0 :
            n = K//li[i]
            count += K//li[i]
            K -= n*li[i]
            if K == 0 :
                break 
        else :
            break
print(count)