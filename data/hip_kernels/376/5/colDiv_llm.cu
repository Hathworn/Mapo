#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void colDiv(float* a, float* b, float* c, int M, int N) {
    int i = blockIdx.y * M + blockIdx.x * blockDim.x + threadIdx.x;
    // Avoid out-of-bound access
    if (i < M * N) {
        int idx_a = blockIdx.y * M + (i % M);
        int idx_b = i % M;
        c[i] = a[idx_a] / b[idx_b];
    }
}