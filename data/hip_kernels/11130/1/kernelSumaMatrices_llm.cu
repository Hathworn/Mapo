#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function for matrix addition
__global__ void kernelSumaMatrices(float *a, float *b, int m, int n) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int j = threadIdx.y + blockIdx.y * blockDim.y;

    // Unroll the loops to improve memory access patterns
    for(; i < m; i += blockDim.x * gridDim.x) {
        for(int j_start = j; j_start < n; j_start += blockDim.y * gridDim.y) {
            a[i * n + j_start] += b[i * n + j_start];
        }
    }
}