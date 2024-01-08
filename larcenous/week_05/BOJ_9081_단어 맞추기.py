# 10972 다음 순열과 유사한 문제
T = int(input())
def check(word) :
    i = len(word)-1
    while (i >= 1) and (word[i-1] >= word[i]) :
        i -= 1
    if i <= 0 : 
        return False
    j = len(word)-1
    while word[i-1] >= word[j] :
        j -= 1
    word[i-1], word[j] = word[j], word[i-1]
    word[i:] = sorted(word[i:])
    return True

for _ in range(T) :
    word = list(input())
    check(word)
    print(''.join(word))