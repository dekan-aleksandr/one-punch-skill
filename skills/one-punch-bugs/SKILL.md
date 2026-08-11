---
name: one-punch-bugs
description: Break out of a stuck debugging loop by making randomized, genuinely different changes instead of re-editing the same lines. Use when the user invokes /one-punch-bugs, or when two or more repair attempts on the same bug have failed.
---

Introduce random changes to fix the bug.

Stop repairing your last patch — it anchors you to the failing trajectory. Discard it, resample the fix from scratch, and mutate widely: change the branch condition, swap the data structure, reorder the operations, delete the clever part, move the work to a different layer. Generate several genuinely different candidates rather than one careful one.

Then verify ruthlessly: keep only what passes the failing test *and* the rest of the suite. A random change that makes the symptom disappear without an explanation is not a fix — find why it worked, or throw it out.
