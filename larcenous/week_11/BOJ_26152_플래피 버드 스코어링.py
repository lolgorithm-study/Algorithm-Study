N = int(input())
A = list(map(int,input().split()))
B = list(map(int,input().split()))
S = []
Q = int(input())
W = list(map(int,input().split()))

for i,j in zip(A,B):
    S.append(i-j)
for i in range(1, len(S)): #단조 감소 처리를 통해 내림차순으로 만듦, 대신 중복된 원소가 존재하므로 upper bound를 찾는 이분탐색이 됨
        if S[i] > S[i-1]:
            S[i] = S[i-1]
S = [-i for i in S] #내림차순 정렬을 오름차순 정렬로 변경

def binary_search(left, right, target):
    while left < right:
        mid = (left + right) // 2
        if S[mid] <= target:
            left = mid + 1
        else:
            right = mid
    return left

for bird in W :
    print(binary_search(0,len(S),-bird))