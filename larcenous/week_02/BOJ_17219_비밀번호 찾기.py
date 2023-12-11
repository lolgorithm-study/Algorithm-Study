import sys
input = sys.stdin.readline
N, M = map(int,input().split())

pw = dict()
for _ in range(N) :
    site, password = input().rstrip().split()
    pw[site] = password

for _ in range(M) :
    site = input().rstrip()
    print(pw[site])