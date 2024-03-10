N = int(input())
li = list(map(int,input().split()))
li.sort()
def two_pointer(li) :
    start = 0
    end = len(li)-1
    ans = abs(li[start]+li[end])
    pair = (start,end)
    while start != end :
        Sum = li[start] + li[end]
        if abs(Sum) < ans :
            ans = abs(Sum)
            pair = (start,end)
        if Sum >= 0 :
            end -= 1
        else : 
            start += 1
    return (li[pair[0]],li[pair[1]])
print(*two_pointer(li))