N = int(input())
book = dict()
for _ in range(N) :
    name = input().rstrip()
    if not name in book.keys() :
        book[name] = 1
        continue #for문의 시작 부분으로 돌아가 다음 요소로 시작
    book[name] += 1
#key=lambda x : (-x[1], x[0]) 
#value기준 내림차순, key기준 오름차순
#[0][0] : 첫번째 (key,value)의 key를 출력 
print(sorted(book.items(), key=lambda x : (-x[1], x[0]))[0][0]) 