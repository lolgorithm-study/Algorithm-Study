import sys
input = sys.stdin.readline

N = int(input().rstrip())
n = set(map(int,input().rstrip().split()))
M = int(input().rstrip())
m = list(map(int,input().rstrip().split()))

[print(1) if i in n else print(0) for i in m]