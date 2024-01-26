fibonacci_count = 0

'''
def fib(n) :
    global fib_count
    if n == 1 or n == 2 :
        return 1
    else :
        return fib(n-1) + fib(n-2)
'''
def fibonacci(n) :
    global fibonacci_count
    f = [1,1]
    for i in range(2,n) :
        f.append(f[i-1] + f[i-2])
        fibonacci_count += 1
    return f[n-1]

n = int(input())
print(fibonacci(n),fibonacci_count)