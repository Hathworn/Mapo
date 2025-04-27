#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cacheMatmul(float *a, float *b, float *c, int n)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    if (i < n && j < n) { // Ensure within bounds
        float acc = 0.0f; // Initialize accumulator
        for (int k = 0; k < n; ++k) { // Optimize by iterating over full range
            acc += a[i * n + k] * b[k * n + j]; // Perform multiplication and accumulation
        }
        c[i * n + j] = acc; // Write result back to c
    }
}