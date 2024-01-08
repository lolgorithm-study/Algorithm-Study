#x,y범위가 작으므로 브루트포스로 구현
'''
좌표평면 상 두 정수 좌표 점(격자점)을 가지고 직선을 만들 때,
직선의 기울기는 (y2-y1)/(x2-x1)이다. 설명을 위해 해당 분수가 기약분수라고 가정하자.
점(x1,y1)에서 시작하여 x좌표에 (x2-x1), y좌표에 (y2-y1)를 계속해서 더해나가면
선분 위에 놓이는 정수 좌표 점이 된다.
gcd(y2-y1, x2-x1)는 점 (x1,y1)와 점 (x2,y2)사이에 
"x좌표에 (x2-x1), y좌표에 (y2-y1)를" 몇 번 더할 수 있는지를 알려준다.
위에서 설명했듯 더해진 점은 정수 좌표 점이며 처음의 두 정수 좌표 점을 이은 선분 위에 놓인다.
따라서 시작점을 포함하여 최대 gcd(y2-y1, x2-x1) + 1 개의 정수 좌표가 존재하게 된다.
'''
N,M,K = map(int,input().split())
def GCD(a,b) :
    if b==0 :
        return a
    else :
        return GCD(b,a%b)
cnt = 0
for x1 in range(0,N+1) :
    for y1 in range(0,M+1) :
        for x2 in range(0,N+1) :
            for y2 in range(0,M+1) :
                if GCD(abs(x2-x1),abs(y2-y1)) + 1 == K :
                    cnt += 1
print(cnt//2)