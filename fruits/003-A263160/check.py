from math import comb, exp, log, pi, sqrt

def normalized(n):
    r = n-1
    N = n*r
    L = log(2)
    mu, sd = N/L, sqrt(N)/L
    terms = [-k*L+n*log(sum(comb(k,j) for j in range(min(k,r)+1)))
             for k in range(max(0,int(mu-14*sd)),int(mu+14*sd)+1)]
    m = max(terms)
    logsum = m+log(sum(exp(v-m) for v in terms))
    loga = log((2**n-2)/2)+logsum
    # The +1 in a(n) is negligible for these n; log-add it explicitly.
    loga += log(1+exp(-loga))
    scale = (n*n-1.5*n+1)*log(n)-n/2*log(pi)-N*log(L)
    return exp(loga-scale)

if __name__ == "__main__":
    L = log(2)
    C = 2*sqrt(2*pi)/L*exp(5/12-L*L/24)
    print("Proposed limit:",C)
    for n in (5,10,20,50,100):
        print(n, normalized(n))
