N = int(input())
topping = input().rstrip().split()
#list comprehension으로 마지막 6글자가 'Cheese'인 경우에만 리스트에 추가
cheese = set([topping[i] for i in range(N) if topping[i][-6:] == 'Cheese'])
if len(cheese) >= 4 :
    print('yummy')
else :
    print('sad')