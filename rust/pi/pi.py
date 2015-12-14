import random
import sys

def montecarlopi(n):
    m = 0.
    n = int(n)
    for i in range(0, n):
        x, y = random.random(), random.random()
        if ((x ** 2) + (y ** 2)) < 1:
            m = m + 1
    return 4 * m / n

print montecarlopi(sys.argv[1])