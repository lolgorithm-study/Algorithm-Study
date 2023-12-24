N = int(input().rstrip())
S = dict([('STRAWBERRY', 0),('BANANA', 0),('LIME', 0),('PLUM',0)])
for _ in range(N) :
    fruit, num = input().rstrip().split()
    S[fruit] += int(num)
if 5 in S.values() : #정확히 5인 경우 'YES'출력
    print('YES')
else :
    print('NO')