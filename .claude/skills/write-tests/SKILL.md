---
name: write-tests
description: Write meaningful tests for existing code — Vitest for TypeScript projects, pytest for Python. Use when a feature lacks coverage or after fixing a bug.
---

Write tests for the code the user points at (or the recent diff if unspecified).

Process:
1. **Read the code under test first.** Understand actual behavior, inputs, outputs, and failure modes before writing anything.
2. **Test behavior, not implementation.** Cover: the happy path, edge cases (empty, null/None, boundaries), and error handling. Skip trivial getters/wrappers.
3. **Bug fixes get a regression test** that fails without the fix — verify this by mentally (or actually) reverting the fix.
4. Match the project's existing test style, file layout, and naming (`*.test.ts` next to source or in `tests/` for Vitest; `tests/test_*.py` for pytest).
5. **Run the new tests** and show they pass. Then run the project's full suite to confirm nothing broke.

Rules:
- No mocking what you can use directly; mock only true external boundaries (network, time, filesystem where slow).
- Each test asserts something specific — no assertion-free "it runs" tests.
- If the code is hard to test, say so and suggest the minimal refactor that would fix it — don't contort the tests around bad seams.
