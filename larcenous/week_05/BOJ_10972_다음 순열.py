#단순 구현은 메모리초과
#n이 10000이므로 n=10000인 경우에 10000!에 해당하는 순열의 개수가 발생
'''from itertools import permutations
comb = list(permutations([i for i in range(1,int(input())+1)]))
try :
    print(*comb[comb.index(tuple(map(int,input().split())))+1])
except :
    print(-1)'''

N = int(input())
a = list(map(int,input().split()))

def next(a) :
    i = len(a)-1 #a 배열의 마지막 인덱스를 i에 저장
    while i >= 1 and a[i-1] > a[i] :
        i -= 1
    if i <= 0 : 
        #i가 오른쪽 끝부터 왼쪽 끝까지 모두 순환한 경우
        #현재 a에서 a[i-1] > a[i]가 만족, 즉 내림차순 정렬이 되어있는 상태
        #a 전체가 내림차순 정렬이면, 사전순으로 가장 마지막 순열이 됨
        return False
    #a[i-1] < a[i]를 만족하는 첫 j를 반환
    #즉 i-1을 기준으로, i부터는 내림차순으로 정렬되어있는 상태
    #i부터 내림차순으로 정렬되어 있다면, 다음 순열을 구하기 위해서 i-1을 다음 큰 숫자로 변경해야함

    #처음 등장하는 a[i-1]보다 큰 숫자를 찾는 부분(j)
    j = len(a)-1 #a 배열의 마지막 인덱스를 j에 저장
    while j > i and a[i-1] > a[j] :
        j -= 1
    #a[i-1] < a[j]를 만족하는 첫 j를 반환
    a[i-1], a[j] = a[j], a[i-1] #두 인덱스 값을 교환, 즉 a[i-1]을 큰 숫자로 변경
    a[i:] = sorted(a[i:]) #교환 이후에는 a[i:] 부분 순열이 사전순 마지막 순열이 되므로, 오름차순 정렬을 통해 사전순 첫 순열로 변경해줌
    return True

if next(a) :
    print(*a)
else : #False인 경우 입력된 순열 a가 사전순 마지막 순열이므로 -1을 출력
    print(-1)