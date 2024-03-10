N = int(input())
bud = list(map(int,input().split()))
M = int(input())
def check(mid) :
    sum = 0
    for budget_req in bud :
        if budget_req <= mid :
            sum += budget_req
        else :
            sum += mid
    return sum

def binary_search(left,right) :
    mid = (left+right)//2 #상한액
    if left > right :
        return mid
    sum = 0
    if check(mid) ==  M:
        return mid
    elif check(mid) <  M:
        return binary_search(mid+1,right)
    else :
        return binary_search(left, mid-1)

print(binary_search(0,max(bud)))