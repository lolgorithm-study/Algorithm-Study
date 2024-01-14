#회전,대조를 통해 나오는 가능한 모든 경우에 대해 계산
import sys
input = sys.stdin.readline #빠른 입출력
N, M = map(int, input().split())
board = [list(map(int,input().split())) for _ in range(N)]
#변수 초기화
maximum = 0
Straight_cnt1 = Straight_cnt2 = Square_cnt = T_cnt1 = T_cnt2 = T_cnt3 = T_cnt4 = L_cnt1 = L_cnt2 = L_cnt3 = L_cnt4 = S_cnt1 = S_cnt2 = 0
for i in range(N) :
    for j in range(M) :
        if i+3 < N :
            Straight_cnt1 = board[i][j] + board[i+1][j] + board[i+2][j] + board[i+3][j]
        if j+3 < M :
            Straight_cnt2 = board[i][j] + board[i][j+1] + board[i][j+2] + board[i][j+3]

        if i+1 < N and j+1 < M :
            Square_cnt = board[i][j] + board[i+1][j] + board[i][j+1] + board[i+1][j+1]

        if i+1 < N and j+2 < M :
            T_cnt1 = board[i][j] + board[i][j+1] + board[i][j+2] + board[i+1][j+1]
        if i+2 < N and j+1 < M :
            T_cnt2 = board[i][j+1] + board[i+1][j+1] + board[i+2][j+1] + board[i+1][j]
        if i+1 < N and j+2 < M :
            T_cnt3 = board[i+1][j] + board[i+1][j+1] + board[i+1][j+2] + board[i][j+1]
        if i+2 < N and j+1 < M :
            T_cnt4 = board[i][j] + board[i+1][j] + board[i+2][j] + board[i+1][j+1]

        if i+2 < N and j+1 < M : 
            L_cnt1 = board[i][j] + board[i+1][j] + board[i+2][j] + board[i+2][j+1]
        if i+1 < N and j+2 < M :
            L_cnt2 = board[i][j] + board[i][j+1] + board[i][j+2] + board[i+1][j]
        if i+2 < N and j+1 < M :
            L_cnt3 = board[i][j] + board[i][j+1] + board[i+1][j+1] + board[i+2][j+1]
        if i+1 < N and j+2 < M :
            L_cnt4 = board[i+1][j] + board[i+1][j+1] + board[i+1][j+2] + board[i][j+2]

        if i+2 < N and j+1 < M : 
            L_cnt5 = board[i][j+1] + board[i+1][j+1] + board[i+2][j+1] + board[i+2][j]
        if i+1 < N and j+2 < M :
            L_cnt6 = board[i][j] + board[i+1][j] + board[i+1][j+1] + board[i+1][j+2]
        if i+2 < N and j+1 < M :
            L_cnt7 = board[i][j] + board[i][j+1] + board[i+1][j] + board[i+2][j]
        if i+1 < N and j+2 < M :
            L_cnt8 = board[i][j] + board[i][j+1] + board[i][j+2] + board[i+1][j+2]

        if i+2 < N and j+1 < M :
            S_cnt1 = board[i][j] + board[i+1][j] + board[i+1][j+1] + board[i+2][j+1]
        if i+1 < N and j+2 < M :
            S_cnt2 = board[i+1][j] + board[i+1][j+1] + board[i][j+1] + board[i][j+2]

        if i+2 < N and j+1 < M :
            S_cnt3 = board[i+1][j] + board[i+2][j] + board[i+1][j+1] + board[i][j+1]
        if i+1 < N and j+2 < M :
            S_cnt4 = board[i][j] + board[i][j+1] + board[i+1][j+1] + board[i+1][j+2]
        #최댓값 계산
        maximum = max(maximum, Straight_cnt1, Straight_cnt2, Square_cnt, T_cnt1, T_cnt2, T_cnt3, T_cnt4, L_cnt1, L_cnt2, L_cnt3, L_cnt4, L_cnt5, L_cnt6, L_cnt7, L_cnt8, S_cnt1, S_cnt2, S_cnt3, S_cnt4)
print(maximum)