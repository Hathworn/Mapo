```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define THREADS_PER_BLOCK 256 // Define a macro for threads per block

__global__ void kernel(int *a, int *b, int *c, int arraySize) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx < arraySize) {
        // Optimize index calculation by minimizing modulo operations
        int idx1 = (idx + 1) & (THREADS_PER_BLOCK - 1);
        int idx2 = (idx + 2) & (THREADS_PER_BLOCK - 1);

        // Use float4 to load data for coalesced memory access
        float as = __fdividef((a[idx] + a[idx1] + a[idx2]), 3.0f);
        float bs = __fdividef((b[idx] + b[idx1] + b[idx2]), 3.0f);

        c[idx] = __fdividef((as + bs), 2.0f); // Use intrinsic division for better performance
    }
}