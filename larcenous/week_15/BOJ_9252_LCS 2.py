A = input().rstrip()
B = input().rstrip()

def LCS_DP(A,B) :
    DP = [[0]*(len(B)+1) for _ in range(len(A)+1)]
    for i in range(1,len(A)+1):
        for j in range(1,len(B)+1):
            if A[i-1] != B[j-1] :
                DP[i][j]=max(DP[i][j-1],DP[i-1][j])
            else :
                DP[i][j]=DP[i-1][j-1]+1
    return DP

#print(LCS_DP(A,B))

def LCS(DP) : #역추적을 하는 함수
    result = []
    i, j = len(A),len(B) #DP 2차원 배열의 가로 세로 끝 index 지정
    maximum = DP[-1][-1]
    print(maximum)
    if maximum > 0 :
        while maximum != 0 and i > 0 and j > 0:
            if maximum == DP[i-1][j] :
                i-=1
            elif maximum == DP[i][j-1] :
                j-=1
            else :
                result.append(A[i-1])
                maximum -= 1
                i-=1
                j-=1
        print(*result[::-1], sep="")

tmp = LCS_DP(A,B)
LCS(tmp)