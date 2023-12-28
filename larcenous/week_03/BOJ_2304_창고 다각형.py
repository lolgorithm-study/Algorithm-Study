import sys
input = sys.stdin.readline
N = int(input())
LH = [list(map(int,input().split())) for _ in range(N) ]
LH = sorted(LH, key=lambda x : x[0])
LH_reversed = list(reversed(LH))
maximum = max(LH, key = lambda x : x[-1])

ans = 0
#좌측
prevL, prevH = LH[0]
for L, H in LH :
    if L == maximum[0] :
        ans += (L-prevL) * prevH
        break
    if H > prevH :
        ans += (L-prevL) * prevH
        prevL, prevH = L,H
#우측
prevL, prevH = LH[-1]
for L, H in LH_reversed :
    if L == maximum[0] :
        ans += (prevL - L) * prevH
        break
    if H > prevH :
        ans += (prevL - L) * prevH
        prevL, prevH = L,H

print(ans + maximum[-1]) #가운데와 덧셈

# 이거 왜 안될까요
'''import sys
input = sys.stdin.readline
N = int(input())
LH = [list(map(int,input().split())) for _ in range(N)]
LH = sorted(LH, key=lambda x : x[0])
stack = []
ans = 0
left = LH[0][-1]
right = LH[-1][-1]
for L, H in LH :
    if len(stack) > 0 :
        if stack[-1][-1] <= H :
            stack.append([L,H])
        elif stack[-1][-1] > H  and H >= right:
            stack.append([L,H])
    else : 
        stack.append([L,H])
ans += sum([stack[i][-1] for i in range(len(stack))])
if len(stack) > 1 :
    for i in range(len(stack)-1) :
        ans += (stack[i+1][0] - stack[i][0] -1) * min(stack[i][-1], stack[i+1][-1])
print(ans)'''