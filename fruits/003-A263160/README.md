# Fruit 003 — A first-zero lattice-path asymptotic

**Status:** candidate asymptotic proof; independent review and novelty check pending. No complete Lean proof.

Source: [OEIS A263160](https://oeis.org/A263160), by Alois P. Heinz; asymptotic proposed by Vaclav Kotesovec on November 13, 2026. See the [historical source dossier](https://the-omega-institute.github.io/trureturing-mdbook/Library/FiniteGeometry/kotesovec2026a263160.html) and [related formal research on a weaker diagonal limit](https://www.trureturing.org/research/oeis-a263160-first-zero-diagonal-limit/). The exact counting representation is related to prior work, not claimed as new.

## Claim

Start at (n,...,n) in n dimensions; each step subtracts 1 from a nonempty subset of coordinates and the path stops when a coordinate first reaches 0. With a(n) the number of paths,

$$a(n)\sim C\frac{n^{n^2-3n/2+1}}{\pi^{n/2}(\log 2)^{n(n-1)}},\qquad C=\frac{2\sqrt{2\pi}}{\log2}\exp(5/12-(\log2)^2/24).$$

The constant is approximately 10.753662835613289, agreeing with the published approximation 10.75366283….

## Argument

Let r=n-1, N=nr, L=log 2 and S_r(k)=sum_{j=0}^r C(k,j).

### Counting identity

Let B(t) count t-step words of nonempty coordinate subsets in which each coordinate is used at most r times. Allowing empty subsets gives S_r(k)^n for k slots; choosing the nonempty slots yields S_r(k)^n=sum_{t=0}^N C(k,t) B(t). Since sum_{k>=0} 2^(-k) C(k,t)=2, summing gives sum_t B(t)= (1/2)sum_{k>=0}2^(-k) S_r(k)^n.

A path is formed by a safe prefix and a final subset meeting the coordinates that have already been used r times. If b is the number of safe prefixes, every nonempty subset appended to one gives either a nonempty safe prefix or a terminal path. Hence (2^n-1)b=(b-1)+a(n), so

$$a(n)=1+\frac{2^n-2}{2}\sum_{k\ge0}2^{-k}S_r(k)^n.$$

### Local saddle expansion

Set z=(Lk-N)/sqrt(N). Uniformly for bounded z, k=N/L+z sqrt(N)/L and

$$k^N e^{-Lk}\sim (N/L)^N e^{-N}e^{-z^2/2}.$$

Expanding the logarithm of the falling factorial gives

$$\log\frac{r!\binom{k}{r}}{k^r}=-\frac{r(r-1)}{2k}-\frac{r(r-1)(2r-1)}{12k^2}+O(r^4/k^3).$$

Also S_r(k)/C(k,r)=1+r/k+O(n^{-2}) in this region, by bounding successive ratios of binomial terms. Multiplying the logarithm by n and substituting k yields

$$\log\frac{(r!)^n S_r(k)^n}{k^N}=-\frac{L(r-1)}{2}+L-\frac{L^2}{6}+\frac{Lz}{2}+o(1).$$

The error is uniform on each compact z interval.

### Tail justification

For N/(2L)<=k<=2N/L, the elementary bounds log(1-u)<=-u and S_r(k)/C(k,r)<=1/(1-r/(k-r+1)) (for large n) give

$$\log\frac{(r!)^n S_r(k)^n}{k^N}\le -\frac{nr(r-1)}{2k}+O(1).$$

Relative to the central exponent -L(r-1)/2, the right-hand side is at most O(1+|z|) because k is bounded below by N/(2L). Meanwhile N(log(kL/N)-kL/N+1)<=-c z² on that interval for some absolute c>0. These bounds give an integrable majorant exp(-c z²+O(|z|+1)) for the normalized summands.

Outside the interval use Vandermonde's identity S_r(k)<=C(k+r,r)<=(k+r)^r/r!. Write u=k+r; the bound for the summand becomes e^(Lr)u^N e^(-Lu)/(r!)^n. For large n the shifted u is separated from N/L by a fixed relative fraction. The left tail has O(N) terms, each exponentially small relative to the peak. On the right tail the logarithmic derivative N/u-L is bounded above by a strictly negative constant, giving a geometric bound. Both tails are therefore exp(-Omega(N)+O(n)) relative to the normalized peak, and negligible. The central sum converges to the Gaussian integral by the Riemann-sum approximation with mesh L/sqrt(N).

### Integration and Stirling expansion

Using integral exp(-z²/2+Lz/2) dz = sqrt(2π) exp(L²/8), with integration over the real line, gives

$$\sum_{k\ge0}2^{-k}S_r(k)^n\sim\frac{N!}{L^{N+1}(r!)^n}\exp(-Ln/2+2L-L^2/24).$$

Here Stirling's formula for N! absorbs the peak and Gaussian width. A further Stirling expansion, retaining the 1/(12r) term in log(r!) because it is multiplied by n, gives

$$\frac{N!}{(r!)^n}\sim\frac{\sqrt{2\pi}\,e^{5/12}\,n^{N+1}}{(2\pi n)^{n/2}}.$$

Indeed the factor (n/r)^(n/2) tends to e^(1/2), and the factorial correction contributes e^(-1/12). Substituting into the counting identity proves the claimed asymptotic.

## Numerical reproduction

[check.py](check.py) uses a floating-point log-sum-exp calculation over a truncated saddle window. It is a numerical illustration, not a certified bound or exact enumeration. Full asymptotic formalization and independent checking of the argument remain open tasks for this repository.
