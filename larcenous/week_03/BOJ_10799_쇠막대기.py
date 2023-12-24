bracket = list(input())
stack = []
ans = 0
for i in range(len(bracket)) :
    if bracket[i] == '(' :
        stack.append(bracket[i])
    else :
        if bracket[i-1] == '(' : #()이므로 레이져
            stack.pop() #stack에 추가된 (가 레이져의 앞부분이므로 pop
            ans += len(stack)
        else : #))
            ans += 1
            stack.pop() #하나의 쇠막대기가 종료되었으므로 pop
print(ans)

#시간초과
'''bracket = list(input())
stick = []
ans = 0
prev = ''
while bracket :
    print(bracket)
    tmp = bracket.pop()
    if tmp == ')' and bracket[-1] == '(' :
        tmp = bracket.pop()
        stick = [i+1 for i in stick]
        prev = tmp
    elif tmp == ')' :
        stick.append(1)
        prev = tmp
    elif tmp == '(' :
        ans += stick.pop()
        print('ans', ans)
        prev = tmp
    print(stick)

print(ans)'''