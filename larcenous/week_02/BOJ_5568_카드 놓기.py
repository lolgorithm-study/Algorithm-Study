from itertools import permutations
n = int(input())
k = int(input())
card = [input() for _ in range(n)]
print(len(set([''.join(case) for case in permutations(card,k)])))

'''
from itertools import permutations
n = int(input())
k = int(input())
print(len(set([''.join(case) for case in permutations([input() for _ in range(n)],k)])))
'''