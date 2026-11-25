# Fruit 002 — Circles on a two-row grid

**Status:** candidate proof; independent review and novelty check pending.

Source: [OEIS A384700](https://oeis.org/A384700), formula conjecture attributed to Scott R. Shannon and N. J. A. Sloane, June 7, 2025.

## Theorem

Let a(n) count the distinct circles passing through at least three points of {0,...,n-1} × {0,1}, for n>=1. Then

$$a(n)=\left\lceil\frac{2n^3-n^2-4n}{4}\right\rceil.$$

Equivalently, a(2m)=4m^3-m^2-2m and a(2m+1)=4m^3+5m^2.

## Proof

A noncollinear triple uses two points on one row and one on the other. There are 2n C(n,2)=n²(n-1) such triples. Every circle meets each row at most twice, so a circle through three grid points occurs once in this count and a circle through four occurs four times. If Q(n) counts the latter, then a(n)=n²(n-1)-3Q(n).

Two distinct points on each row, with horizontal coordinates i<j and k<l, are concyclic if and only if i+j=k+l. Necessity follows from the common horizontal coordinate of the two perpendicular bisectors. Conversely, with equal midpoint c, a center (c,y) equidistant from the two chords exists uniquely: equality of squared radii is a linear equation in y with nonzero coefficient. Its radius is positive because the chords have distinct endpoints.

Let c_s count pairs 0<=i<j<n with i+j=s. Then Q(n)=sum_s c_s², as every choice of one pair from each row with the same sum gives exactly one four-point circle.

For 1<=s<=n-1 the pair count is floor((s+1)/2), and reflection gives c_s=c_(2n-2-s). Therefore, for m>=1,

$$Q(2m)=m^2+4\sum_{r=1}^{m-1}r^2,$$

$$Q(2m+1)=3m^2+4\sum_{r=1}^{m-1}r^2.$$

Substitute the identity sum of r² for r=1,...,m-1 = (m-1)m(2m-1)/6. Inserting these expressions into a(n) gives the two polynomial formulas above. The n=1 case is zero directly. For even n the fraction in the theorem is an integer; for odd n its fractional part is 1/4, so taking the ceiling adds 3/4. QED.

## Reproduction

[check.py](check.py) enumerates circles independently using exact rational centers and squared radii, and compares against the formula. [Fruit002.lean](../../lean/Fruit002.lean) contains initial geometry and arithmetic lemmas, not a full formalization of circle enumeration.
