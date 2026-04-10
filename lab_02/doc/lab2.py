import time

def f(x):
    return x * x - x * x + x*4 - x*5 + x + x

def time1():

    print(f'enter the num of iterations: ', end='')
    n = input()

    if n.isdigit():

        n = int(n)

        if n >= 0:

            x = 5
            start = time.time()

            for i in range(n):
                m = f(x)

            end = time.time()

            execution_time = end - start
            print(f'time: {execution_time*10**6} us')

        else:
            print('ERROR: your num < 0\n')

    else:
        print('ERROR: restart and enter uint num!!\n')

s = 'y'

while s == 'y':
    time1()
    print('run again? (y/n): ', end='')
    s = input()


