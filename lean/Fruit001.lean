import Mathlib

namespace Fruit001

/-- Integer coefficient of degree d in the ménage hit polynomial. -/
def coeff (n d : ℕ) : ℤ :=
  ∑ k ∈ Finset.Icc d n,
    (-1 : ℤ) ^ (k-d) * (Nat.choose k d : ℤ) *
    ((2*n*Nat.choose (2*n-k) k / (2*n-k) : ℕ) : ℤ) *
    (Nat.factorial (n-k) : ℤ)

/-- Target proposition only; not yet proved. -/
def generalizedCongruence : Prop :=
  ∀ (p n d : ℕ), Nat.Prime p → 0 < n → d < p →
    (p : ℤ) ∣ coeff n d + 2 * coeff (n+p) d + coeff (n+2*p) d

/-- Example of the second-difference divisibility used in the note. -/
theorem quadratic_second_difference (a b c n p : ℤ) :
    p^2 ∣ (a*(n+2*p)^2+b*(n+2*p)+c) -
      2*(a*(n+p)^2+b*(n+p)+c) + (a*n^2+b*n+c) := by
  refine ⟨2*a, ?_⟩
  ring

end Fruit001
