# Lean 4 formalization (work in progress)

These files contain initial statements and algebraic lemmas only. They were not compiled in the drafting environment. No result is marked as fully formalized. The project uses mathlib v4.19.0 as an initial reproducible toolchain choice.

From the repository root, with elan installed:

```sh
lake update
lake exe cache get
lake build
```

The target for Fruit 001 is a definition of a proposition, not a theorem claiming the proposition. Fruit 002 formalizes selected arithmetic and midpoint steps; the finite set enumeration remains to be formalized. Fruit 003 requires a substantial analysis formalization and is not included yet. Please do not treat a successful build of these partial lemmas as validation of the full research notes.
