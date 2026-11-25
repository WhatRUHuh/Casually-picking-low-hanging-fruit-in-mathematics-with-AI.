import Mathlib

namespace Fruit002

/-- Two distinct horizontal endpoints equidistant from c have midpoint c. -/
theorem midpoint (i j c : ℝ) (hij : i ≠ j)
    (h : (i-c)^2 = (j-c)^2) : i+j = 2*c := by
  have hp : (i-j)*(i+j-2*c) = 0 := by nlinarith only [h]
  have hz := (mul_eq_zero.mp hp).resolve_left (sub_ne_zero.mpr hij)
  linarith

def sumSq : ℕ → ℤ
  | 0 => 0
  | n+1 => sumSq n + ((n : ℤ)+1)^2

theorem sumSq_formula (n : ℕ) :
    6 * sumSq n = (n : ℤ) * ((n : ℤ)+1) * (2*(n : ℤ)+1) := by
  induction n with
  | zero => norm_num [sumSq]
  | succ n ih =>
    simp only [sumSq, Nat.cast_succ]
    calc
      6 * (sumSq n + ((n : ℤ)+1)^2) =
        6 * sumSq n + 6 * ((n : ℤ)+1)^2 := by ring
      _ = _ := by rw [ih]; ring

theorem even_count_algebra (m S : ℤ)
    (h : 6*S = (m-1)*m*(2*m-1)) :
    (2*m)^2*(2*m-1)-3*(m^2+4*S) = 4*m^3-m^2-2*m := by
  linear_combination -2*h

theorem odd_count_algebra (m S : ℤ)
    (h : 6*S = (m-1)*m*(2*m-1)) :
    (2*m+1)^2*(2*m)-3*(3*m^2+4*S) = 4*m^3+5*m^2 := by
  linear_combination -2*h

end Fruit002
