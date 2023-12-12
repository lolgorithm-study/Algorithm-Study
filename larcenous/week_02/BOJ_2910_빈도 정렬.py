#1
from collections import Counter
N, C = map(int,input().split())
num_seq = list(map(int,input().split()))
cnt = Counter(num_seq)
#list의 index로 우선 등장 순서 기준을 설정
sorted_num = sorted(num_seq, key=lambda x : (-cnt[x], num_seq.index(x))) #Counter는 먼저 투입된 순서대로 key,value를 생성
print(*sorted_num)

#2
#등장 순서를 기준으로 설정하지 않았는데, 반영이 된다.
from collections import Counter
N, C = map(int,input().split())
num = list(map(int,input().split()))
cnt_dict = dict(sorted(dict(Counter(num)).items(),key=lambda x : -x[1])) 
for key,value in cnt_dict.items() :
    for _ in value :
        print(key, end=' ')

#숏코딩
'''from collections import Counter
N, C = map(int,input().split())
print(' '.join([' '.join(map(str,[key]*value))for key,value in dict(sorted(dict(Counter(list(map(int,input().split())))).items(),key=lambda x:-x[1])).items()]))'''