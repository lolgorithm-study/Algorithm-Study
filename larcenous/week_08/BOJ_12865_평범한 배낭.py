#Bottom-Up
N, K = map(int,input().split())
item_li = [[0,0]]+[list(map(int,input().split())) for _ in range(N)] #[0] : 무게 #[1] : 가치
#print(item_li)
P = [[0]*(K+1) for _ in range(N+1)]
for i in range(1,N+1) : #i : item 인덱스이면서 P의 행 인덱스
    for j in range(1,K+1) : #무게를 1부터 K까지 #j : P의 열 인덱스, 무게
        if item_li[i][0] > j :
            P[i][j] = P[i-1][j] #넣을 수 없는 경우
        else :
            P[i][j] = max(P[i-1][j], P[i-1][j-item_li[i][0]]+item_li[i][1]) #점화식
#print(P)
print(P[N][K])