# Sanitizers

More information:
https://google.github.io/kernel-sanitizers/
https://origin.kernel.org/doc/html/latest/dev-tools/

## UBSAN

UBSAN is a runtime undefined behaviour checker.
Often enabled in release kernels.

## KASAN

Kernel Address Sanitizer (KASAN) is a dynamic memory safety error detector designed to find out-of-bounds and use-after-free bugs.

KASAN has three modes:
1. Generic KASAN
2. Software Tag-Based KASAN
3. Hardware Tag-Based KASAN

## KCSAN

The Kernel Concurrency Sanitizer (KCSAN) is a dynamic race detector, which relies on compile-time instrumentation, and uses a watchpoint-based sampling approach to detect races. KCSAN’s primary purpose is to detect data races.

## KMSAN

KMSAN is a dynamic error detector aimed at finding uses of uninitialized values.
Integrated into the kernel starting with version Linux v6.1 (December 2022).
Requires kernel compilation using the Clang compiler.
