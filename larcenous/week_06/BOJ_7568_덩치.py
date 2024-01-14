N = int(input())
list_people = [tuple(map(int,input().split())) for i in range(N)]
rank_li = [1 for i in range(N)] #출력할 리스트
for a in range(N): #이중 for loop로 한 명에 대해 다른 사람들 모두를 대조하여 덩치가 더 큰 사람이 있을 경우 순위에 +1
    for b in range(N):
        if list_people[a][0] < list_people[b][0] and list_people[a][1] < list_people[b][1]:
            rank_li[a] += 1
[print(rank_li[j],end=" ") for j in range(N)] #출력