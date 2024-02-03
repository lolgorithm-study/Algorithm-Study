from collections import deque
N, M = map(int,input().split())
T = deque(list(map(int,input().split())))
T_set = set(T)
T.append('exit')
flag = True
t = 0
togi = 0
togi_coffee = 0
customer = T.popleft()
def make_togi() :
    global togi
    togi += 1
    return 
def make_coffee() :
    global togi, togi_coffee
    togi -= 1
    togi_coffee += 1
    return
def serve_coffee() :
    global togi_coffee
    togi_coffee -= 1
    return
def is_togi() :
    global togi
    return togi > 0
def is_coffee() :
    global togi_coffee
    return togi_coffee > 0

while customer != 'exit' :
    if t in T_set :
        if is_coffee() :
            serve_coffee()
            #print(t, customer, 'serve')
            t += 1
            continue
        else :
            print('fail')
            flag = False
            break
    elif t >= customer-M and is_togi() :
        make_coffee()
        #print(t, customer, 'make_coffee')
        t += 1
        customer = T.popleft()
        continue
    else :
        make_togi()
        #print(t, customer, 'make_togi')
        t += 1
if flag :
    print('success')