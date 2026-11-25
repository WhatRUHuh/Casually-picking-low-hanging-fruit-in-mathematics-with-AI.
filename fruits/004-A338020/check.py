from fractions import Fraction as F
from itertools import combinations_with_replacement

def atan_bounds(q, terms=30):
    s = sum((F((-1)**j, (2*j+1)*q**(2*j+1)) for j in range(terms)), F(0))
    t = s + F((-1)**terms, (2*terms+1)*q**(2*terms+1))
    return min(s,t), max(s,t)

def pi_bounds():
    l5,u5 = atan_bounds(5)
    l239,u239 = atan_bounds(239)
    return 16*l5-4*u239, 16*u5-4*l239

def main():
    lo,hi = pi_bounds()
    floors = []
    for n in range(101):
        l,h = (lo*n*n).__floor__(), (hi*n*n).__floor__()
        assert l == h, (n,l,h)
        floors.append(l)
    a = [0]+[floors[n]-floors[n-1] for n in range(1,101)]
    assert a[1:9] == [3,9,16,22,28,35,40,48]
    assert all(a[n]<a[n+1] for n in range(1,100))
    count=0
    for i,j,k in combinations_with_replacement(range(1,101),3):
        assert (a[i]+a[j]>a[k]) == (i+j>k), (i,j,k)
        count+=1
    for n in range(2,99):
        assert a[n]+a[n+1]>a[n+2]
        assert a[n+2]-a[n] == (a[n+2]-a[n+1])+(a[n+1]-a[n])
    print(f'{count} sorted triples passed with certified rational bounds for pi.')

if __name__ == "__main__":
    main()
