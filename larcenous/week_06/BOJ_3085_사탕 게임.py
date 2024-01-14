'''
아이디어 : 교환한 모든 경우에 대해 최대 개수를 계산하고, 비교하여 최댓값을 출력한다.
'''
N = int(input()) #입력
def candy(board) :
    maximum = 0
    for i in range(N) :
        cnt = 1
        for j in range(N-1) :
            if board[i][j+1] == board[i][j] : #오른쪽 칸과 같은 캔디라면
                cnt += 1
            else :
                cnt = 1 #다르다면 초기화
            maximum = max(cnt, maximum)
        cnt = 1
        for j in range(N-1) :
            if board[j+1][i] == board[j][i] : #아래 칸과 같은 캔디라면
                cnt += 1
            else :
                cnt = 1 #다르다면 초기화
            maximum = max(cnt, maximum)
    return maximum
                    
board = []
maximum = 0
for _ in range(N) :
    board.append(list(input().rstrip()))
for i in range(N) :
    for j in range(N) :
        if j < N-1 :
            #오른쪽과 교환
            board[i][j],board[i][j+1] = board[i][j+1],board[i][j] #교환
            maximum = max(candy(board),maximum)
            board[i][j],board[i][j+1] = board[i][j+1],board[i][j] #다시 교환하여 원래 상태로
        if i < N-1 :
            #아래와 교환
            board[i][j],board[i+1][j] = board[i+1][j],board[i][j]
            maximum = max(candy(board),maximum)
            board[i][j],board[i+1][j] = board[i+1][j],board[i][j]
print(maximum)