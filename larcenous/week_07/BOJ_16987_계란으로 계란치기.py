N = int(input())
eggs = [list(map(int,input().split())) for _ in range(N)] #0이 내구도, 1이 무게
check = [True] * N
maximum = 0
def search(eggs,depth,check) :
    global maximum
    ch = sum(check)
    if ch <= 1 or depth == N :
        maximum = max(maximum,N-ch)    
    else :
        if not check[depth] :
            search(eggs,depth+1, check)
        else :
            for j in range(N) :
                if j == depth or not check[j] :
                    continue 
                eggs[depth][0], eggs[j][0] = eggs[depth][0] - eggs[j][1], eggs[j][0] - eggs[depth][1]
                check = [False if egg[0] <= 0 else True for egg in eggs]
                search(eggs,depth+1, check)
                eggs[depth][0], eggs[j][0] = eggs[depth][0] + eggs[j][1], eggs[j][0] + eggs[depth][1]
search(eggs,0, check)
print(maximum)