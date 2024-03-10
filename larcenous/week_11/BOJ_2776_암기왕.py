def binary_search(left,right,target) :
    if left > right :
        return 0
    mid = (left+right)//2
    if note1[mid] == target :
        return 1
    elif note1[mid] < target :
        return binary_search(mid+1,right,target)
    else :
        return binary_search(left, mid-1, target)

T = int(input())
for _ in range(T) :
    N = int(input())
    note1 = list(map(int,input().split()))
    note1.sort()
    M = int(input())
    note2 = list(map(int,input().split()))
    for num in note2 :
        print(binary_search(0, len(note1)-1, num))