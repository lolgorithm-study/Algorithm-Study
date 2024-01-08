'''
수열의 안정도를 구하기 위해서는 수열의 연속 부분 수열이 두 가지 조건을 만족시켜야 한다.
1) 부분 수열의 길이는 소수이다.
2) 부분 수열의 합은 소수이다.
'''
#누적합 사용
N = int(input())
a = list(map(int,input().split()))
#소수 찾기
#10만(500*2000)까지의 소수를 계산
check = [False, False] + [True] * int(1e6-1) 
prime = []
for i in range(2,int(1e6+1)) :
    if check[i] :
        prime.append(i)
        for j in range(i*2, int(1e6+1), i) :
            check[j] = False

#수열의 합은 소수여야 하므로 누적합으로 부분 수열의 합을 구한다.
cum_sum = [sum(a[:i+1]) for i in range(len(a))]

#누적합 배열에서 조건에 맞는 수열을 탐색
cnt = 0 #정답을 출력할 변수
for i in range(len(cum_sum)) :
    if check[i+1] and check[cum_sum[i]] : 
        # cum_sum의 index+1은 부분 수열의 길이를 의미한다. 
        # 따라서 이를 check에 넣어 수열의 길이가 소수인지(조건 1)) 파악한다.

        # cum_sum[i]는 부분 수열의 합을 의미한다.
        # 따라서 이를 check에 넣어 수열의 합이 소수인지(조건 2)) 파악한다.
        cnt += 1

#cum_sum의 원소 간 뺄셈을 하여 만들어지는 부분 수열의 합에서 조건에 맞는 수열의 개수를 탐색
for i in range(0,len(cum_sum)) :
    if prime[i] >= len(cum_sum) : #탈출 조건
        break
    for j in range(len(cum_sum)) :
        if j + prime[i] > len(cum_sum) - 1 : #인덱스 바깥을 벗어나는 경우 break 
            break
        sub = cum_sum[j+prime[i]]-cum_sum[j] #소수만큼 떨어진 원소간의 뺄셈은 조건 1)을 만족시킨다. 
        if check[sub] : # 조건 2)를 확인한다.
            cnt += 1
print(cnt)