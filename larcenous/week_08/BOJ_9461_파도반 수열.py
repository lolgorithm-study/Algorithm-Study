import sys
input = sys.stdin.readline
T = int(input().rstrip())
answer = [int(input().rstrip()) for _ in range(T)]
li = [0,1,1,1,2,2,3,4,5,7,9]
result = [0] * (max(answer) + 1)
if max(answer) + 1 < 11 :
    result = li
else :
    result[0:11] = li

def wave(n) :
    if n<11 :
        return
    else :
        for i in range(11, n+1) :
            result[i] = result[i-1] + result[i-5] #그려가며 규칙을 찾았다
wave(max(answer))
for i in answer :
    print(result[i])