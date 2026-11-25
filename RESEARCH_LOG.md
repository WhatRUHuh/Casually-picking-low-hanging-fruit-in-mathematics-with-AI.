# Research provenance

- Date: 2026-11-26 (UTC+08:00).
- Human initiator and maintainer: WhatRUHuh.
- AI: GPT-6.2, ChatGPT.
- Original prompt for Fruit 001: “话说要不你现在就随手给我摘取一个目前没人要的低垂的果实看看？”
- Follow-up for Fruit 002: “来，你继续来一个低垂果实”
- Follow-up for Fruit 003: “？？？？牛逼，继续来一个低垂果实”
- Follow-up for Fruit 004: “绷不住了，你在来一个”
- Follow-up for Fruit 005: “继续来一个”
- ChatGPT interface-reported thinking times, as shown in screenshots supplied by the human initiator: Fruit 001: 55 s; Fruit 002: 35 s; Fruit 003: 53 s. Fruit 004: 25 s (reported by the human initiator). Fruit 005: 55 s (reported by the human initiator). All five displayed durations were under one minute.
- These figures refer to the displayed thinking time for each research turn, not independently measured total elapsed time, time to a completed proof, subsequent checking, or formal verification. In particular, Fruit 002's screenshot shows the opening response before the intermediate target was discarded.
- An attempted intermediate target, A397356, was dropped after prior work was found.
- The notes are edited research summaries, not complete transcripts. No independent human review, full Lean proof, or first-discovery claim is asserted.

Direct OEIS page retrieval was blocked during initial repository preparation; indexed OEIS excerpts, related literature, and linked research records were used. The source links remain available for readers to check the exact statements and revision histories.

For Fruit 004, the public [OEIS A338020](https://oeis.org/A338020) entry was directly retrieved and its definition, conjecture, and attribution checked. The accompanying exact Python script passed 171,700 sorted triples on November 26, 2026. Lean compilation was not available locally.

For Fruit 005, the [OEIS A397045](https://oeis.org/A397045) entry was directly retrieved on November 26, 2026. It attributes the sequence to Ali Sada (June 14, 2026) and the proposed exponent and constant to Charles R. Greathouse IV (June 15, 2026). The new exact enumeration script was executed successfully for n=1..10. The analytic argument is not Lean-formalized; priority is unconfirmed. An earlier target was abandoned during exploration after related prior work was found.

## Verification milestone: v0.1.1

On November 26, 2026 (UTC+08:00), [Research checks #8](https://github.com/WhatRUHuh/Casually-picking-low-hanging-fruit-in-mathematics-with-AI./actions/runs/45683916081) succeeded for commit `7db3df027a9306b319f951985ebe90c5ae45b988`. Both numerical-checks and lean-draft-build passed. The previous Lean failure was due to missing `lake-manifest.json`; CI now runs `lake update`, obtains the Mathlib cache, and builds the project. The log explicitly reports successful builds of Fruit001, Fruit002, Fruit004 and MathFruit. Fruit004.triangle_iff proves the generalized inequality over integer indices and real alpha > 3; its identification with the original OEIS geometric count and the degenerate-triangle claim remain outside the formal proof. Fruit001 and Fruit002 contain supporting lemmas, not complete proofs; Fruits 003 and 005 remain unformalized. No independent review or priority claim is made. The v0.1.0 archive is preserved.
