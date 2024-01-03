#N = 5000000으로 0.2초만에 반복문 2번 순회 불가
#규칙을 찾아 사용(증명 모름)
N = int(input())
check = [False, False] + [True] * (N-1)
prime = []
#소수 찾기
if N == 1 :
    print(1,0)
elif N == 2 :
    print(0,2)
else :
    for i in range(2,N+1) :
        if check[i] :
            prime.append(i)
            for j in range(i*2, N+1, i) :
                check[j] = False
    print(N-(len(prime)*2-1),len(prime)*2-1)