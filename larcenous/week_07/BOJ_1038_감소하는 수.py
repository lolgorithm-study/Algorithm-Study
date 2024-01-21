N = int(input())
ans = []
num = []
def check(i) :
    global num
    if len(num) == 1 :
        return True
    elif i < num[-2] :
        return True
    else :
        return False
def make(depth) :
    global num
    for i in range(10) :
        num.append(i)
        if check(i) : # i < num[-1] 인 경우 인덱스 오류
            make(depth + 1)
            ans.append(int(''.join(map(str,num))))
        num.pop()
make(0)
ans.sort()
if len(ans) <= N : #len(ans) : 1023
    print(-1)
else :
    print(ans[N])