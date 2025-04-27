```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __veccmp(int *a, int *b, int *d) {
    int xa = *a;
    int xb = *b;
    int xc = 0;
    int xd = 0;

    // Use a loop to reduce code repetition
    for (int i = 0; i < 4; i++) {
        asm("vset4.s32.s32.ne" "%0, %1.b%d%d%d%d, %2, %3;" : "=r" (xd) : "r" (xa), "r" (xb), "r" (xc), "i" (i));
        *d++ = xd;  // Increment pointer and store result
    }
}