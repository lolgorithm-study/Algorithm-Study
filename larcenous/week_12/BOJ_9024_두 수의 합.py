import sys
def two_pointers(li,k) :
    start = 0
    end = len(li)-1
    pair = 0
    minimum = sys.maxsize
    while start != end :
        summation = li[start] + li[end]
        if summation > k :
            dist = abs(k-summation)
            if dist < minimum :
                minimum = dist
                pair = 1
            elif dist == minimum :
                pair += 1
            end -= 1
        elif summation < k :
            dist = abs(k-summation)
            if dist < minimum :
                minimum = dist
                pair = 1
            elif dist == minimum :
                pair += 1
            start += 1            
        else :
            if minimum == 0 :
                pair += 1
            else :
                minimum = 0
                pair = 1
            start += 1
    return pair

t = int(input())
for _ in range(t) :
    n, k = map(int,input().split())
    li = list(map(int,input().split()))
    li.sort()
    print(two_pointers(li,k))