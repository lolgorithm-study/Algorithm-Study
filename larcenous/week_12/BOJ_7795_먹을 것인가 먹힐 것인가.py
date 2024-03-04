def two_pointer(A,B) :
    cnt = 0
    pair = 0
    for i in range(N):
        while True :
            if cnt == len(B) or A[i] <= B[cnt] :
                pair += cnt
                break
            else :
                cnt += 1
    return pair

T = int(input())
for _ in range(T) :
    N, M = map(int,input().split())
    #A가 B를 먹는다
    A = sorted(list(map(int,input().split())))
    B = sorted(list(map(int,input().split())))
    print(two_pointer(A,B))