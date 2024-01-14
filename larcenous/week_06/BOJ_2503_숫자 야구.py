'''
가장 작은 수인 123부터 가장 큰 수인 987까지 순환하며, 주어진 볼과 스트라이크의 개수를 만족하는 수인 경우 count
'''
N = int(input().rstrip())
question = [list(map(int,input().split())) for _ in range(N)]
cnt = 0
def check(num) :
    for q in question :
        n, s, b = str(q[0]), q[1], q[2] #입력
        strike, ball = 0, 0 #초기화
        for i in range(3) : #자릿수 인덱스 3만큼 반복
            if num[i] == n[i] : #스트라이크인 경우
                strike += 1
            elif num[i] in n : #볼인 경우 #스트라이크인 경우 위의 조건에서 걸러진다.
                ball += 1
        if not ((strike == s) & (ball == b)) : #개수가 불일치 하면 False를 리턴
            return False
    return True #False가 리턴되지 않은 경우 True를 리턴
for num in range(123,987+1) :
    num = str(num)
    if (num[0] == num[1]) | (num[0] == num[2]) | (num[1] == num[2]) : #중복된 숫자가 존재하면 건너띔
        continue
    if '0' in num : #0이 존재하면 건너띔
        continue
    if check(num) :
        cnt += 1
print(cnt)