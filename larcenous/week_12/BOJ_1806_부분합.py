import sys
N, S = map(int,input().split())
li = list(map(int,input().split()))
cum_li = [0]
cum = 0
for i in range(len(li)) :
    cum += li[i]
    cum_li.append(cum)

def two_pointers(li,S) :
    start = 0
    end = 0
    length = sys.maxsize
    while start <= end and end < len(li) :
        summation = li[end]-li[start]
        if summation >= S :
            length = min(length, end-start)
            start += 1
        else : 
            end += 1
    return length
length = two_pointers(cum_li,S)
if length == sys.maxsize :
    print(0)
else :
    print(length)