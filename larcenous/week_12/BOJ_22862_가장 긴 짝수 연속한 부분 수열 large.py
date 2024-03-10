N, K = map(int,input().split())
li = list(map(int,input().split()))
def two_pointer(li) :
    even = 0
    odd = 0
    start = 0
    end = 0
    ans = 0
    if li[end] %2 == 0 :
        even += 1
    else :
        odd += 1
    while end < len(li) and start <= end :
        if odd <= K :
            ans = max(ans, even)
            end += 1
            if end < len(li) and li[end] %2 == 0 :
                even += 1
            else :
                odd += 1
        else :
            if li[start] %2 == 0 :
                even -= 1
            else :
                odd -= 1
            start += 1 
    return ans
print(two_pointer(li))