#include "hip/hip_runtime.h"
#include "includes.h"

#define N   (1024*1024)
#define FULL_DATA_SIZE   (N*20)

__global__ void kernel(int *a, int *b, int *c) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx < N) {
        int idx1 = (idx + 1) & 255; // Use bitwise AND instead of modulo for power of 2
        int idx2 = (idx + 2) & 255; // Use bitwise AND instead of modulo for power of 2

        // Load values from global memory to registers
        float a0 = a[idx];
        float a1 = a[idx1];
        float a2 = a[idx2];
        float b0 = b[idx];
        float b1 = b[idx1];
        float b2 = b[idx2];

        // Compute averaged sums
        float as = (a0 + a1 + a2) * 0.333333f; // Use multiplication instead of division
        float bs = (b0 + b1 + b2) * 0.333333f;

        c[idx] = (as + bs) * 0.5f; // Simplify expression
    }
}