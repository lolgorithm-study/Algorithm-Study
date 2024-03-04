N, M = map(int,input().split())
T = [int(input()) for _ in range(N)]
left = min(T)
right = max(T)*M
def binary_search(left, right, target) :
    ans = right
    while left < right :
        mid = (left + right)//2
        total = 0

        for i in range(N) : #핵심
            total += mid // T[i]
        
        if total >= target :
            right = mid
            ans = min(mid, ans)
        else :
            left = mid + 1
    return ans
print(binary_search(left,right,M))