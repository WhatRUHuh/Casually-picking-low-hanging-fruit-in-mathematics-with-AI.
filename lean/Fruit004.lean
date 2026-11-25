import Mathlib

namespace Fruit004

/-- Floor differences indexed by integers; in the OEIS application n > 0. -/
noncomputable def b (a : ℝ) (n : ℤ) : ℤ :=
  ⌊a * (n : ℝ)^2⌋ - ⌊a * ((n : ℝ)-1)^2⌋

/-- Error bound for a floor difference. Draft, not yet compiled. -/
theorem error_bound (a : ℝ) (n : ℤ) :
    -1 < (b a n : ℝ) - a * (2*(n : ℝ)-1) ∧
    (b a n : ℝ) - a * (2*(n : ℝ)-1) < 1 := by
  let x : ℝ := a * (n : ℝ)^2
  let y : ℝ := a * ((n : ℝ)-1)^2
  have hx₁ : (⌊x⌋ : ℝ) ≤ x := Int.floor_le x
  have hx₂ : x < (⌊x⌋ : ℝ) + 1 := Int.lt_floor_add_one x
  have hy₁ : (⌊y⌋ : ℝ) ≤ y := Int.floor_le y
  have hy₂ : y < (⌊y⌋ : ℝ) + 1 := Int.lt_floor_add_one y
  have hxy : x-y = a * (2*(n : ℝ)-1) := by dsimp [x,y]; ring
  have hb : (b a n : ℝ) = (⌊x⌋ : ℝ) - (⌊y⌋ : ℝ) := by
    unfold b
    push_cast
    rfl
  rw [hb, ← hxy]
  constructor <;> linarith

/-- Generalized strict triangle inequality. Draft, not yet compiled. -/
theorem triangle_iff (a : ℝ) (ha : 3 < a) (i j k : ℤ) :
    b a k < b a i + b a j ↔ k < i+j := by
  obtain ⟨hi₁,hi₂⟩ := error_bound a i
  obtain ⟨hj₁,hj₂⟩ := error_bound a j
  obtain ⟨hk₁,hk₂⟩ := error_bound a k
  have hdiff : (b a i : ℝ) + (b a j : ℝ) - (b a k : ℝ) =
    a * (2*((i : ℝ)+(j : ℝ)-(k : ℝ))-1) +
    ((b a i : ℝ)-a*(2*(i : ℝ)-1)) +
    ((b a j : ℝ)-a*(2*(j : ℝ)-1)) -
    ((b a k : ℝ)-a*(2*(k : ℝ)-1)) := by ring
  have hp : 0 ≤ a := by linarith
  by_cases h : k < i+j
  · have hstep : k+1 ≤ i+j := by omega
    have hc : (k : ℝ)+1 ≤ (i : ℝ)+(j : ℝ) := by exact_mod_cast hstep
    have hm : a ≤ a*(2*((i : ℝ)+(j : ℝ)-(k : ℝ))-1) := by
      calc
        a = a*1 := by ring
        _ ≤ _ := mul_le_mul_of_nonneg_left (by linarith) hp
    have hr : (b a k : ℝ) < (b a i : ℝ)+(b a j : ℝ) := by linarith
    have hz : b a k < b a i + b a j := by exact_mod_cast hr
    simp [h,hz]
  · have hstep : i+j ≤ k := by omega
    have hc : (i : ℝ)+(j : ℝ) ≤ (k : ℝ) := by exact_mod_cast hstep
    have hm : a*(2*((i : ℝ)+(j : ℝ)-(k : ℝ))-1) ≤ -a := by
      calc
        _ ≤ a*(-1) := mul_le_mul_of_nonneg_left (by linarith) hp
        _ = -a := by ring
    have hr : (b a i : ℝ)+(b a j : ℝ) < (b a k : ℝ) := by linarith
    have hz : b a i + b a j < b a k := by exact_mod_cast hr
    simp [h, not_lt_of_ge (le_of_lt hz)]

end Fruit004
