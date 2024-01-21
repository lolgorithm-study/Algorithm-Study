N, M = map(int,input().split())
li = list(sorted(map(int, input().split())))
printed = set()
def search(lis : list, li) :
    if len(lis) == M :
        if not tuple(lis) in printed :
            print(*lis)
        printed.add(tuple(lis))
        return
    for num in li :
        tmp = li.copy()
        tmp.remove(num)
        search(lis + [num], tmp)
search([],li)