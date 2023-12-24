import sys
input = sys.stdin.readline

t = int(input())
for _ in range(t) : #각 테스트 케이스 별
    n = int(input())
    item = {}
    for i in range(n) : #각 패션 아이템 별 입력 전처리
        name, type = input().rstrip().split()
        if not type in item :
            item[type] = 2
        else :
            item[type] += 1
    ans = 1
    for value in item.values() :
        ans *= value
    print(ans-1) #알몸인 경우 제외