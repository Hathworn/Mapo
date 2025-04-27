#include "hip/hip_runtime.h"
#include "includes.h"

#define N   (1024*1024)
#define FULL_DATA_SIZE   (N*20)

__global__ void kernel(int *a, int *b, int *c) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx < N) {
        // Precompute reused indices
        int idx1 = (idx + 1) % 256;
        int idx2 = (idx + 2) % 256;
        
        // Load data from global memory once
        int a0 = a[idx], a1 = a[idx1], a2 = a[idx2];
        int b0 = b[idx], b1 = b[idx1], b2 = b[idx2];

        // Compute averages directly
        float as = (a0 + a1 + a2) / 3.0f;
        float bs = (b0 + b1 + b2) / 3.0f;

        // Store result
        c[idx] = (as + bs) * 0.5f;
    }
}