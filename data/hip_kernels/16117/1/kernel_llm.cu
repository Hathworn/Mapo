#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(int *a, int *b, int *c) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx < N) {
        // Precompute index values to avoid redundant calculations
        int idx1 = (idx + 1) & 255; // Use bitwise AND for modulo 256
        int idx2 = (idx + 2) & 255; // Use bitwise AND for modulo 256

        // Use temporary variables to store intermediate results
        int aSum = a[idx] + a[idx1] + a[idx2];
        int bSum = b[idx] + b[idx1] + b[idx2];

        // Perform final computation using precomputed sums
        c[idx] = (aSum + bSum) / 6;
    }
}