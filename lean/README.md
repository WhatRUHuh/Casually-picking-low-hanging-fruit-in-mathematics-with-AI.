# Lean 4 formalization (work in progress)

These files contain initial formalization drafts. They were not compiled in the drafting environment. No result is marked as fully formalized. The project uses mathlib v4.19.0 as an initial reproducible toolchain choice.

From the repository root, with elan installed:

```sh
lake update
lake exe cache get
lake build
```

The target for Fruit 001 is a definition of a proposition, not a theorem claiming the proposition. Fruit 002 formalizes selected arithmetic and midpoint steps; the finite set enumeration remains to be formalized. Fruit 003 requires a substantial analysis formalization and is not included yet. Fruit 004 includes an uncompiled proof draft of the generalized floor-difference theorem; the identification with the OEIS circle count and the original degenerate-triangle statement are not yet formalized. Fruit 005 requires formalization of squarefree counting, multiquadratic-field linear independence, Laplace sums and concentration; see [the formalization roadmap](Fruit005.md). No Lean theorem for Fruit 005 is included yet. Please do not treat a successful build of these partial lemmas as validation of the full research notes.
