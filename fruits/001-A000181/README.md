# Fruit 001 — A congruence for ménage hit polynomials

**Status:** candidate proof; independent review and novelty check pending.

Source: [OEIS A000181](https://oeis.org/A000181), conjecture attributed to Mark van Hoeij, June 10, 2019. The sequence is the coefficient of degree 4 of the ménage hit polynomial (initial terms 2, 15, 60, 469, 3660). Related polynomial reference: [Asymptotics for Ménage polynomials and certain hypergeometric polynomials of type 3F1](https://www.sciencedirect.com/science/article/pii/S0021904512000792).

## Theorem

For positive integers n define

$$U_n(x)=\sum_{k=0}^n\frac{2n}{2n-k}\binom{2n-k}{k}(n-k)!(x-1)^k.$$

For every prime p and positive integer n,

$$U_n(x)+2U_{n+p}(x)+U_{n+2p}(x)=0\quad\text{in }\mathbb F_p[x]/(x^p).$$

In particular, if a(n) is the coefficient of degree 4 in U_n, then for n >= 4 and p > 3 prime,

$$p\mid a(n)+2a(n+p)+a(n+2p).$$

## Proof

Put j=n-k and

$$R_j(n)=\frac{2n}{n+j}\binom{n+j}{2j}.$$

For j=0 this is 2. For j>=1 it can be written

$$R_j(n)=\frac{2n}{(2j)!}\prod_{s=1-j}^{j-1}(n+s).$$

The product vanishes if j>n, so extend R_j(n) by zero there. All R_j(n) are integers: for 0<=k<=n the original coefficient is the sum of binomial coefficients C(2n-k,k)+C(2n-k-1,k-1), with the second term zero when k=0.

For any integer polynomial P, its second forward difference with step p is divisible by p squared. This follows by expanding each monomial at n: the constant and first-order terms cancel. Apply this to the numerator of R_j. For 1<=j<p the factorial (2j)! has p-adic valuation at most 1. Consequently

$$R_j(n)-2R_j(n+p)+R_j(n+2p)\equiv0\pmod p$$

for 0<=j<p (j=0 is constant).

Now work in the quotient ring A=F_p[x]/(x^p). The element x-1 is a unit and (x-1)^p=-1, including characteristic 2. Terms with j>=p vanish because their coefficients contain j!. Hence

$$U_n(x)=\sum_{j=0}^{p-1}j! R_j(n)(x-1)^{n-j}$$

in A; negative powers are legitimate because x-1 is a unit. Substituting n+p and n+2p changes the power by factors -1 and +1 respectively. Thus the claimed linear combination is

$$\sum_{j=0}^{p-1}j!(x-1)^{n-j}(R_j(n)-2R_j(n+p)+R_j(n+2p))=0.$$

The degree-4 coefficient is preserved in the quotient when p>4. This yields the OEIS congruence. QED.

## Reproduction

Run [check.py](check.py) for exact integer coefficient tests. A Lean target and preliminary algebraic lemmas are in [Fruit001.lean](../../lean/Fruit001.lean). The Lean source compiled successfully in [CI run #8](https://github.com/WhatRUHuh/Casually-picking-low-hanging-fruit-in-mathematics-with-AI./actions/runs/45683916081). The quadratic second-difference lemma is proved, but the general congruence is still a target proposition, not a Lean theorem.
