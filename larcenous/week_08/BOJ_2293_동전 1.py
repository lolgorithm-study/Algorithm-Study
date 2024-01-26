n, k = map(int,input().split())
coin = []
memo = [0 for _ in range(k+1)]
for _ in range(n) :
    num = int(input())
    if num <= k :
        coin.append(num)
for i in range(len(coin)) :
    memo[coin[i]] += 1
    for j in range(coin[i],k+1) :
        memo[j] += memo[j-coin[i]]
        
        #print(memo)
    #print()
print(memo[k])