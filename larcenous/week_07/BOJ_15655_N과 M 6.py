N, M = map(int,input().split())
li = list(sorted(map(int, input().split())))
def search(lis : list) :
    if len(lis) == M :
        print(*lis)
        return
    for num in li :
        if not num in lis :
            if sorted(lis + [num]) == lis + [num] :
                search(lis + [num])
search([])