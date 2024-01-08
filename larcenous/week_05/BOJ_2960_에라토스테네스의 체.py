'''
문제 풀이를 우선하다보니 더러운 코드가 되었는데 피드백 환영합니다.
'''
N, K = map(int,input().split())
check = [False, False] + [True] * (N-1)
cnt = 0
for i in range(2,N+1) :
    if check[i] :
        check[i] = False
        cnt += 1
        if cnt == K :
            print(i)
            break
        for j in range(i*2, N+1, i) :
            if check[j] :
                check[j] = False
                cnt += 1
                if cnt == K :
                    print(j)
                    break
    if cnt == K :
        break