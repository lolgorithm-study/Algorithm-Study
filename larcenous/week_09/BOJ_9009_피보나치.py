T = int(input())
test = [int(input()) for _ in range(T)]
memo = dict()
memo[0] = 1
memo[1] = 1
i = 2
while True :
    memo[i] = memo[i-1] + memo[i-2]
    if memo[i] > 1000000000 :
        break
    i += 1
for case in test :
    tmp = list(memo.values())
    ans = []
    n = 0
    while len(tmp) > 0 :
        num = tmp.pop()
        if num > case :
            continue
        case -= num
        ans.append(num)
    ans.sort()
    print(*ans)