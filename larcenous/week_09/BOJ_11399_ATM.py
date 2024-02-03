import sys
input = sys.stdin.readline

N = int(input().rstrip())
li = list(map(int,input().split()))
li = sorted(li)
c_li = [0]*(N+1)
for i in range(N) :
    c_li[i+1] = c_li[i] + li[i]

print(sum(c_li))