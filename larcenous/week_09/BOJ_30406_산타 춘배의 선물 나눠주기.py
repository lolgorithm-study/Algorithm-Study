from collections import Counter
N = int(input())
li = list(map(int,input().split()))
cnt = Counter(li)
sat = 0
while cnt[0] > 0 and cnt[3] > 0  :
    sat += 3
    cnt[0] -= 1
    cnt[3] -= 1
while cnt[1] > 0 and cnt[2] > 0  :
    sat += 3
    cnt[1] -= 1
    cnt[2] -= 1
while cnt[0] > 0 and cnt[2] > 0  :
    sat += 2
    cnt[0] -= 1
    cnt[2] -= 1
while cnt[1] > 0 and cnt[3] > 0  :
    sat += 2
    cnt[1] -= 1
    cnt[3] -= 1
while cnt[0] > 0 and cnt[1] > 0  :
    sat += 1
    cnt[0] -= 1
    cnt[1] -= 1
while cnt[2] > 0 and cnt[3] > 0  :
    sat += 1
    cnt[2] -= 1
    cnt[3] -= 1
print(sat)