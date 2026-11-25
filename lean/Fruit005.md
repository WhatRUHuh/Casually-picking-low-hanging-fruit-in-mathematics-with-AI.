# Fruit 005 — Lean formalization roadmap

Status: not formalized. This roadmap is not a Lean proof and makes no kernel-verification claim.

1. Define the set of squarefree natural numbers d>1 and nonnegative finitely supported multiplicity vectors (e.g. Finsupp).
2. Prove rational linear independence of the squarefree radicals and the bijection between interval values and vectors of total weight < n+1.
3. Establish squarefree counting via the Möbius indicator and the Euler product at 2.
4. Establish the H_j Laplace-sum estimates for j=0,1,2, including uniform bounds, via partial summation.
5. Define the partition function, justify its Euler product and logarithm expansion, and obtain the limiting constant using dominated convergence.
6. Construct the geometric product law or the normalized measure on finite-support vectors; establish its first and second moments and the concentration estimate.
7. Prove the matching logarithmic upper and lower bounds and specialize to the sequence.

Intended final claim: the ratio of log(a(n)) to n^(2/3) tends to (81*zeta(3)/pi²)^(1/3) as n tends to infinity, with a(n) defined by the actual counting problem. A proof of a conditional analytic lemma alone is not a full formalization.
