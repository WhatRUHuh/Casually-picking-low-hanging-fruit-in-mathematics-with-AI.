from fractions import Fraction as F
from itertools import combinations

def circles(n):
    seen = set()
    for i,j in combinations(range(n),2):
        x = F(i+j,2)
        for k in range(n):
            y = (1 + (k-x)**2 - (i-x)**2)/2
            r2 = (i-x)**2 + y*y
            seen.add((x,y,r2))
            seen.add((x,1-y,r2))
    return len(seen)

def main():
    for n in range(1,31):
        expected = (2*n**3-n*n-4*n+3)//4
        actual = circles(n)
        assert actual == expected, (n,actual,expected)
    print("Exact distinct-circle enumeration passed for n=1..30.")

if __name__ == "__main__":
    main()
