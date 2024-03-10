import sys
N, K = map(int,input().split())
doll = list(map(int,input().split()))
def two_pointer(li, K) :
    cnt = 0
    length = sys.maxsize
    start, end = 0,0
    if li[end] == 1 :
        cnt += 1
    while end < len(li):
        if cnt >= K :
            if end-start+1 < length :
                length = end-start+1
            if li[start] == 1 :
                cnt -= 1
            start += 1
        else :
            end += 1
            if end < len(li) and li[end] == 1 :
                cnt += 1
    return length
answer = two_pointer(doll, K)
if answer == sys.maxsize :
    print(-1)
else :
    print(answer)