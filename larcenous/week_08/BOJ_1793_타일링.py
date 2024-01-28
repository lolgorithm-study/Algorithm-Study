#n이 0부터 250까지이므로 bottom-up을 시도
memo = [0]*251 #251개의 원소를 가지는 배열 생성
memo[0] = 1
memo[1] = 1
memo[2] = 3

for i in range(3,251) : #tabulation 진행
    memo[i] = memo[i-1] + memo[i-2] * 2

while True : #테스트케이스 개수가 주어지지 않아서 try, except 구문을 사용
    try :
        n = int(input())
    except :
        break
    print(memo[n])

#top-down 방식은 recursion error
'''memo = dict()
memo[0] = 1
memo[1] = 1
memo[2] = 3
def search(n) :
    if n in memo.keys() :
        return memo[n]
    else :
        memo[n] = search(n-1) + search(n-2) * 2
        return memo[n]
while True :
    try :
        n = int(input())
    except :
        break
    print(search(n))'''