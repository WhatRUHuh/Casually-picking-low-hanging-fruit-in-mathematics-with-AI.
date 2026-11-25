# Lean 4 formalization (work in progress)

These files were successfully compiled in [CI run #8](https://github.com/WhatRUHuh/Casually-picking-low-hanging-fruit-in-mathematics-with-AI./actions/runs/45683916081). The log confirms all three Fruit modules and the MathFruit aggregate built successfully. Fruit 004's generalized inequality is fully proved in Lean; the original OEIS statements are not yet fully formalized. The project uses mathlib v4.19.0 as an initial reproducible toolchain choice.

From the repository root, with elan installed:

```sh
lake update
lake exe cache get
lake build
```

The target for Fruit 001 is a definition of a proposition, not a theorem claiming the proposition. Fruit 002 formalizes selected arithmetic and midpoint steps; the finite set enumeration remains to be formalized. Fruit 003 requires a substantial analysis formalization and is not included yet. Fruit 004 includes the compiled proof `Fruit004.triangle_iff` of the generalized floor-difference theorem; the identification with the OEIS circle count and the original degenerate-triangle statement are not yet formalized. Fruit 005 requires formalization of squarefree counting, multiquadratic-field linear independence, Laplace sums and concentration; see [the formalization roadmap](Fruit005.md). No Lean theorem for Fruit 005 is included yet. Please do not treat a successful build of these partial lemmas as validation of the full research notes.
