N = int(input())
log = set()
import sys

count = 0
for i in range(N) :
    string = sys.stdin.readline().rstrip() 
    if string == 'ENTER' :
        log = set() #set 초기화
    else :
        if not string in log :
            log.add(string)
            count += 1
print(count)