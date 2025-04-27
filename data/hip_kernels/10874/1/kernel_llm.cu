#include "hip/hip_runtime.h"
#include "includes.h"

#define N 256

__global__ void kernel(int *a, int *b, int *c) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;

    if (idx < N) {
        // Load values from global memory
        int a0 = a[idx];
        int a1 = a[(idx + 1) % 256];
        int a2 = a[(idx + 2) % 256];
        
        int b0 = b[idx];
        int b1 = b[(idx + 1) % 256];
        int b2 = b[(idx + 2) % 256];

        // Compute averages
        float as = (a0 + a1 + a2) / 3.0f;
        float bs = (b0 + b1 + b2) / 3.0f;

        // Store the result
        c[idx] = (as + bs) / 2;
    }
}