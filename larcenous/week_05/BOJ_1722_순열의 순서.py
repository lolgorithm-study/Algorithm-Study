'''
20!은 매우 높은 수이므로, 브루트포스로는 불가능하다.

1. k번째 순열 찾기

1) 남은 자리 중 가장 앞에 가용한 숫자 중 가장 작은 숫자가 올 때, 몇 가지 순열이 만들어질 수 있는지를 계산한다. 해당 개수를 now 변수에 저장한다.
2) now와 k를 비교한 뒤, k가 더 크다면 mul += 1을 하여 반복한다. (mul은 남은 숫자 중 몇 번째 작은 숫자를 사용하는지를 나타낸다.)
3) k가 작아지게 된다면 직전의 값(mul-1)을 이용하여 k를 갱신한다. k = k - now*(mul-1)
4) 1부터 N까지의 수 중, 이미 사용되지 않은 수에서 mul번째 작은 수를 ans에 append하고 사용처리한다.
5) 1)부터 4)을 N번 반복한다

2. 순열이 몇 번째인지 찾기

1) 현재 자리(처음에는 가장 왼쪽)의 숫자가 현재 가용한 숫자중 몇번째로 작은 숫자인지를 확인하고, 몇번째인지 cnt에 저장한다.
2) 현재 탐색 중인 자리를 제외한 나머지 자리에 올 수 있는 순열의 개수를 계산하여 now에 할당한다.
3) ans에 now * (cnt-1)을 더해준다.
4) space += 1을 하여 다음 자리로 넘어가 1)부터 3)을 N번 반복한다.
'''
import math
N = int(input())
n, *a = map(int,input().split()) #첫 원소만 n으로 할당, 나머지는 리스트로 a에 할당
used = [False] * 21 #N은 최대 20
if n == 1 : #맨 앞이 1인 경우
    k = int(a[0]) #k
    ans = [] #출력할 답
    i = 1
    while True :
        mul = 1
        if i > N :
            break
        while True :
            now = math.perm(N-i,N-i)
            if now*mul >= k :
                k = k - now*(mul-1)
                cnt = 1
                for j in range(1,N+1) :
                    if used[j] :
                        continue
                    else :
                        if cnt == mul :
                            ans.append(j)
                            used[j] = True
                            break
                        else :
                            cnt += 1
                break
            mul += 1
        i += 1
    print(*ans)

else : #맨 앞이 2인 경우
    ans = 1 #출력할 답
    space = 1 #자릿수
    while True :
        if space > N :
            break
        cnt = 1 #몇번째로 작은지
        for i in range(1,N+1) :
            if i == a[space-1]:
                now = math.perm(N-space,N-space)
                for j in range(1,N+1) :
                    if used[j] :
                        continue
                    else :
                        if j == i:
                            break
                        else :
                            cnt += 1
                ans += now*(cnt-1)
                used[i] = True
                break
        space += 1
    print(ans)