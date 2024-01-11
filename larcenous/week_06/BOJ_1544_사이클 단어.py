#원형 단어이므로, 원형 큐를 사용해보자는 아이디어
from collections import deque
def check(q) :
    res = True
    for _ in range(len(q)) :
        q.rotate(1)
        if ''.join(q) in uni_string :
            res = False
            break
    return res
N = int(input())
uni_string = set() #유니크한 단어를 저장할 set
#set을 사용한 이유는 in 연산의 시간복잡도를 줄이기 위해서
for _ in range(N) :
    string = deque(list(input())) #입력된 단어를 deque로
    if check(string) : #회전시킨 모든 단어가 uni_string에 없다면
        uni_string.add(''.join(string)) #deque를 다시 str로 만들어 set에 저장
print(len(uni_string))