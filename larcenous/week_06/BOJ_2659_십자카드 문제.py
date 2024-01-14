def cal_clock_num(num : str) : #입력된 수에 대해 시계수를 계산하는 함수
    clock_num = []
    num = list(num)
    for _ in range(4) :
        clock_num.append(''.join(num))
        num.insert(0,num.pop()) #마지막 숫자를 0번째(첫번째) 인덱스로 삽입
    return int(min(clock_num)) #가장 작은 숫자를 리턴

in_num = ''.join(input().split())
clock_num = cal_clock_num(in_num)
cnt = 0
for num in range(1111,clock_num+1) :
    if '0' in str(num) : #0이 있는 경우 건너띔
        continue
    if num == cal_clock_num(str(num)) : #시계수와 같다면 count
        cnt += 1
print(cnt)

#오답 코드
'''clock_num = int(''.join(sorted(input().split()))) #시계방향으로 계산하지 않았다.
cnt = 0
for num in range(1111,clock_num+1) :
    if '0' in str(num) :
        continue
    if str(num) == ''.join(sorted(list(str(num)))) :
        cnt += 1
print(cnt)'''