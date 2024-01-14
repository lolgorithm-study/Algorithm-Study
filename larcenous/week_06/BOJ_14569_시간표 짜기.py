'''
아이디어 : 모든 학생에 대해 들을 수 있는 과목 수 계산을 반복
후보 개수를 세는 것이므로 현재 내 시간표에서 신청할 수 있는 과목끼리 시간이 겹치더라도 모두 세어야 한다.
'''
N = int(input().rstrip())
subject = [list(map(int,input().split()[1:])) for _ in range(N)]
M = int(input().rstrip())
student = [list(map(int,input().split()[1:])) for _ in range(M)]
for stu in student :
    stu = set(stu) # in 연산의 시간복잡도를 줄이기 위해 set을 사용
    cnt = 0
    for sub in subject :
        flag = True
        for i in range(len(sub)) :
            if not sub[i] in stu : #학생이 들을 수 있는 시간에 포함되지 않으면 False
                flag = False
        if flag :
            cnt += 1
    print(cnt)