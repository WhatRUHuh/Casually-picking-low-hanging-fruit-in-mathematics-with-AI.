# Fruit 004 — Triangle inequalities for floor differences

**Status:** generalized inequality proved in Lean; exact finite checks passed; original OEIS bridge and degenerate-triangle claim not formalized; novelty and independent review pending.

**Displayed thinking time:** 25 seconds, as reported by the human initiator for the initial ChatGPT research turn (not total verification time).

Source: [OEIS A338020](https://oeis.org/A338020), established by Torlach Rush on October 6, 2020. The entry asks whether every consecutive triple from index n >= 2 gives the sides of an integer-sided triangle, and whether the three corresponding positive differences give a degenerate triangle.

## General theorem

For a real number alpha > 3 and any positive integer n, put

$$b_\alpha(n)=\lfloor\alpha n^2\rfloor-\lfloor\alpha(n-1)^2\rfloor.$$

For all positive integers i,j,k,

$$b_\alpha(i)+b_\alpha(j)>b_\alpha(k)\quad\Longleftrightarrow\quad i+j>k.$$

In particular, three terms give the side lengths of a nondegenerate triangle if and only if their three indices do.

## Proof

Write the floor of a real number x as x minus its fractional part, which belongs to [0,1). Then

$$b_\alpha(n)=\alpha(2n-1)+\varepsilon_n,\qquad -1<\varepsilon_n<1.$$

Consequently,

$$b_\alpha(i)+b_\alpha(j)-b_\alpha(k)=\alpha(2(i+j-k)-1)+\varepsilon_i+\varepsilon_j-\varepsilon_k.$$

The combined error lies strictly between -3 and 3. If i+j>k, integrality implies i+j-k>=1, so the leading term is at least alpha>3 and the entire difference is positive. If i+j<=k, the leading term is at most -alpha<-3, so the difference is negative. This proves the equivalence. The same error estimate gives b_alpha(n)>0 for n>=1 and

$$b_\alpha(n+1)-b_\alpha(n)>2\alpha-2>0.$$

Applying the equivalence to each of the three possible triangle inequalities proves the stated consequence.

## OEIS conjecture

A circle of area A has radius sqrt(A/pi). Positive integral areas corresponding to radii strictly between n-1 and n are precisely the integers strictly between pi(n-1)^2 and pi n^2. The upper endpoint is irrational for n>=1; the lower endpoint is irrational for n>=2 and equals zero for n=1. Thus in both cases the count is

$$a(n)=\lfloor\pi n^2\rfloor-\lfloor\pi(n-1)^2\rfloor=b_\pi(n).$$

Since pi>3, the general theorem applies. For n>=2 the largest index n+2 is strictly less than n+(n+1); the sequence is strictly increasing, so the only nontrivial triangle inequality holds. Finally, all three differences are positive and

$$a(n+2)-a(n)=(a(n+2)-a(n+1))+(a(n+1)-a(n)).$$

They therefore form the sides of a degenerate triangle. Both claims in the OEIS entry follow. QED.

## Reproduction and formalization

[check.py](check.py) uses Machin's identity pi=16 arctan(1/5)-4 arctan(1/239) and alternating-series rational bounds. The lower and upper rational bounds give identical floors for each index 0 through 100. The script verifies all 171,700 nondecreasing triples of positive indices up to 100, along with monotonicity and the consecutive-triple claims. The script was executed successfully during repository preparation. The finite checks are not a substitute for the proof.

[Lean proof](../../lean/Fruit004.lean) proves the generalized floor-difference inequality as `Fruit004.triangle_iff`, with the supporting lemma `Fruit004.error_bound`. Both compiled successfully in [CI run #8](https://github.com/WhatRUHuh/Casually-picking-low-hanging-fruit-in-mathematics-with-AI./actions/runs/45683916081); the geometric interpretation and degenerate-triangle claim have not yet been formalized.

AI-generated argument: GPT-6.2 (ChatGPT), November 26, 2026. Human initiator and maintainer: WhatRUHuh. No first-proof claim is made.
