from math import comb, factorial
from functools import lru_cache

@lru_cache(None)
def coeff(n, d):
    return sum((-1)**(k-d)*comb(k,d)*
               (2*n*comb(2*n-k,k)//(2*n-k))*factorial(n-k)
               for k in range(d,n+1))

def main():
    assert [coeff(n,4) for n in range(4,9)] == [2,15,60,469,3660]
    checks = 0
    for p in (2,3,5,7,11,13,17,19,23,29,31):
        for n in range(1,51):
            for d in range(p):
                assert (coeff(n,d)+2*coeff(n+p,d)+coeff(n+2*p,d))%p == 0, (n,p,d)
                checks += 1
    print(f"{checks} exact coefficient congruence checks passed.")

if __name__ == "__main__":
    main()
