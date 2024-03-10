n = int(input())
li = list(map(int,input().split()))
li.sort()
x = int(input())

def two_pointer(li,x) :
    cnt = 0
    start = 0
    end = len(li)-1
    while start != end :
        if li[start] + li[end] == x :
            cnt += 1
            end -= 1
        elif li[start] + li[end] > x :
            end -= 1
        else :
            start += 1
    return cnt

print(two_pointer(li,x))