from math import isqrt, log, pi
from functools import lru_cache

SCALE = 10**16
EXPECTED = [3, 7, 17, 35, 76, 148, 295, 564, 1068, 1965]

def squarefree(d):
    return all(d % (q*q) for q in range(2,isqrt(d)+1))

def count(n):
    X = n+1
    limit = X*SCALE
    ds = [d for d in range(2,X*X) if squarefree(d)]
    lows = [isqrt(d*SCALE*SCALE) for d in ds]
    highs = [v+1 for v in lows]
    def bounded(ws):
        @lru_cache(None)
        def walk(i, remaining):
            if i == len(ws) or ws[i] >= remaining:
                return 1
            w = ws[i]
            return sum(walk(i+1, remaining-c*w) for c in range((remaining-1)//w+1))
        return walk(0,limit)
    lower, upper = bounded(highs), bounded(lows)
    assert lower == upper, (n,lower,upper)
    return lower

if __name__ == '__main__':
    for n, expected in enumerate(EXPECTED,1):
        actual = count(n)
        assert actual == expected, (n,actual,expected)
        print(n,actual,log(actual)/n**(2/3))
    # A numerical approximation only; not used for the exact counts.
    zeta3 = sum(1/k**3 for k in range(1,100001))
    print('K (approx.):', (81*zeta3/pi**2)**(1/3))
