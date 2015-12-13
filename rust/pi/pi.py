import random

def montecarlopi(n=10.):
    m = 0.
    for i in range(0, n):
        x, y = random.random(), random.random()
        if ((x ** 2) + (y ** 2)) < 1:
            m = m + 1
    return 4 * m / n

print montecarlopi(100000000)