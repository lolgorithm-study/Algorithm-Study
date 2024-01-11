'''
이길 수 있는 경우를 ans에 만들어 두고, 탐색하여 ans에 해당하는 경우인지를 확인
'''
li = [list(input()) for _ in range(10)]
ans = ['.XXXX','X.XXX','XX.XX','XXX.X','XXXX.']
flag = False
#가로
if not flag :
    for i in range(10) :
        for j in range(6) :
            if ''.join(li[i][j:j+5]) in ans :
                flag = True
#세로
if not flag :
    for i in range(6) :
        for j in range(10) :
            if ''.join([li[i][j],li[i+1][j],li[i+2][j],li[i+3][j],li[i+4][j]]) in ans :
                flag = True
#오른쪽 아래 대각선
if not flag :
    for i in range(6) :
        for j in range(6) :
            if ''.join([li[i][j],li[i+1][j+1],li[i+2][j+2],li[i+3][j+3],li[i+4][j+4]]) in ans :
                flag = True
# 오른쪽 위 대각선
if not flag :
    for i in range(4,10) :
        for j in range(6) :
            if ''.join([li[i][j],li[i-1][j+1],li[i-2][j+2],li[i-3][j+3],li[i-4][j+4]]) in ans :
                flag = True
if flag :
    print(1)
else :
    print(0)