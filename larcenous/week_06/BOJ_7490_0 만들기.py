'''
문자열로 식을 만든 후, eval함수를 통해 문자열 식을 계산
'''
from itertools import product
T = int(input())
plmi = ['', '+', '-'] #ASCII 순서로
print_plmi = [' ', '+', '-'] #출력을 위한 ' '
for _ in range(T) :
    N = int(input())
    prod = list(product(plmi,repeat = N-1)) #N-1개의 중복 순열 생성
    print_prod = list(product(print_plmi,repeat = N-1))
    for i in range(len(prod)) :
        cal = ''
        print_cal = ''
        for j in range(1,N) :
            # f'{변수}' -> '변수값' 문자열이 된다.
            cal += f'{j}{prod[i][j-1]}' #계산을 위한 식
            print_cal += f'{j}{print_prod[i][j-1]}' #출력을 위한 식
        #마지막 전까지는 수식 기호를 포함하여 반복하고, 마지막에는 숫자만 더해준다.
        cal += str(N)
        print_cal += str(N)
        if eval(cal)==0 : #수식을 계산한 것이 0이면 출력
            print(print_cal)
    print()