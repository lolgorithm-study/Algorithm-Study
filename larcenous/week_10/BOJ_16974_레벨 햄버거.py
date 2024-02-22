#참고
#https://velog.io/@hyebinnn/%EB%B0%B1%EC%A4%80-%EB%A0%88%EB%B2%A8-%ED%96%84%EB%B2%84%EA%B1%B0-16974%EB%B2%88
'''
* level 1 - BPPPB
* level 2 - BBPPPBPBPPPBB
'''
N,X = map(int,input().split())
patty = [1] * 51
layout = [1] * 51
for i in range(1,N+1) :
    patty[i] = patty[i-1]*2 + 1 
    layout[i] = layout[i-1]*2 + 3
 
def eat(n,x):
    if n == 0 :
        return x
    if x == 1 : #예제 입력 2에서 확인할 수 있는 경우
        return 0
    elif x <= 1 + layout[n-1] :
        return eat(n-1, x-1)
    elif x == 1 + layout[n-1] + 1 :
        return patty[n-1] + 1
    elif x <= layout[n-1] * 2 + 2 :
        return patty[n-1] + 1 + eat(n-1, (x-(layout[n-1]+2)))
    else :
        return patty[n]

print(eat(N,X))