N = int(input())
dic = dict()
for word in [input() for _ in range(N)] :
    rword = ''.join(reversed(list(word))) #역순으로 된 비밀번호
    if word in dic.values() or word == rword:
        print(len(word),word[len(word)//2])
        break
    dic[word] = rword