#memory : 32140KB
#time : 56ms
import sys
input = sys.stdin.readline
N, M, K = map(int,input().split())
score_dict = dict()
open_score = 0
for _ in range(N) :
    subject, score = input().rstrip().split()
    score_dict[subject] = int(score)
for _ in range(K) :
    open = input().rstrip()
    open_score += score_dict[open]
    score_dict.pop(open)
remained_list = list(sorted(score_dict.values()))
#M-K개의 모르는 과목이 존재
maximum = sum(remained_list[len(remained_list)-(M-K):]) 
minimum = sum(remained_list[:M-K])
print(open_score + minimum, open_score + maximum)


#deque, islice 활용
#memory : 34000KB
#time : 76ms
'''
import sys
from collections import deque
from itertools import islice
input = sys.stdin.readline
N, M, K = map(int,input().split())
score_dict = dict()
open_score = 0
for _ in range(N) :
    subject, score = input().rstrip().split()
    score_dict[subject] = int(score)
for _ in range(K) :
    open = input().rstrip()
    open_score += score_dict[open]
    score_dict.pop(open)
remained_list = deque(sorted(score_dict.values()))
maximum = sum(islice(remained_list, len(remained_list)-M+K, None))
minimum = sum(islice(remained_list, M-K))
print(open_score + minimum, open_score + maximum)
'''

#deque 활용
#memory : 34016KB
#time : 76ms
'''
import sys
from collections import deque
input = sys.stdin.readline
N, M, K = map(int,input().split())
score_dict = dict()
open_score = 0
for _ in range(N) :
    subject, score = input().rstrip().split()
    score_dict[subject] = int(score)
for _ in range(K) :
    open = input().rstrip()
    open_score += score_dict[open]
    score_dict.pop(open)
remained_list = deque(sorted(score_dict.values()))
temp = remained_list.copy()
maximum = sum([temp.pop() for _ in range(M-K)])
minimum = sum([remained_list.popleft() for _ in range(M-K)])
print(open_score + minimum, open_score + maximum)
'''