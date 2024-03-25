import sys
INF = sys.maxsize
N = int(input())
A = list(map(int,input().split())) #부분 수열이므로 정렬 불가

#투 포인터로는 불가?
#upper bound binary search
'''
lower bound는 타겟보다 같거나 큰 값이 나오는 처음 위치를 찾습니다.

upper bound는 타겟보다 처음으로 큰 값이 나오는 위치를 찾습니다.
'''
def bi_search(LIS,target): #중요
    left, right = -1,len(LIS)
    while left+1 < right:
        mid = (left + right) // 2
        if LIS[mid] < target:
            left = mid 
        else:
            right = mid 
    return right

LIS = [-INF]
LIS_total = [(-INF,0)] #역추적을 위해 idx를 함께 저장

A = A[::-1] #맨 앞부터 pop을 통해 활용하기 위해

while A :
    num = A.pop()
    if num > LIS[-1] :
        LIS_total.append((num,len(LIS)))
        LIS.append(num)

    else :
        idx = bi_search(LIS,num)
        LIS[idx] = num
        LIS_total.append((num,idx))

ans = []
LIS_len = len(LIS)-1

while LIS_total :
    if LIS_len <= 0 :
        break
    num, idx = LIS_total.pop()
    if idx == LIS_len:
        ans.append(num)
        LIS_len -= 1

print(len(ans))
print(*ans[::-1])