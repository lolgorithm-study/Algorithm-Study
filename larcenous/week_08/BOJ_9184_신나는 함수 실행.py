import sys
input = sys.stdin.readline

memo = dict()
memo[(0,0,0)] = 1

def w(a,b,c) :
    if memo.get((a,b,c)) != None :
        return memo[(a,b,c)]
    else :
        if a <= 0 or b<= 0 or c<=0 :
            memo[(a,b,c)] = 1
            return 1
        elif a>20 or b>20 or c>20 :
            memo[(a,b,c)] = w(20, 20, 20)
            return w(20, 20, 20)
        elif a<b and b<c :
            memo[(a,b,c)] = w(a,b,c-1) + w(a,b-1,c-1) - w(a,b-1,c)
            return w(a,b,c-1) + w(a,b-1,c-1) - w(a,b-1,c)
        else :
            memo[(a,b,c)] = w(a-1, b, c) + w(a-1, b-1, c) + w(a-1, b, c-1) - w(a-1, b-1, c-1)
            return w(a-1, b, c) + w(a-1, b-1, c) + w(a-1, b, c-1) - w(a-1, b-1, c-1)

while True :
    a,b,c = map(int,input().rstrip().split())
    if a==-1 and b==-1 and c==-1 :
        break
    print(f'w({a}, {b}, {c}) = {w(a,b,c)}')

