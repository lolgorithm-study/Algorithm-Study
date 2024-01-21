from collections import Counter
L, C = map(int,input().split())
string = list(sorted(input().split()))
visited = [False] * C
def make(depth,explore,visited) :
    if depth == L :
        cnt = Counter(explore)
        vowel = cnt['a'] + cnt['e'] + cnt['i'] + cnt['o'] + cnt['u']
        if vowel >= 1 and L-vowel >= 2 :
            print(''.join(explore))
            return
    else :
        for i in range(C):
            if not visited[i] :
                if explore + [string[i]] == sorted(explore + [string[i]]) :
                    visited[i] = True
                    make(depth+1, explore+[string[i]],visited)
                    visited[i] = False
make(0,[],visited)