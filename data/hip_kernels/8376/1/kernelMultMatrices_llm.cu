#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelMultMatrices(float *a, float *b, float *c, int m, int n) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int j = threadIdx.y + blockIdx.y * blockDim.y;

    if (i < n && j < m) { // Ensure threads access valid indices
        float sum = 0.0f; // Use a register for accumulation
        for (int k = 0; k < N; k++) {
            sum += a[j + k * n] * b[k + i * n];
        }
        c[j + i * n] = sum; // Store result in the output matrix
    }
    // Removed __syncthreads() as it's unnecessary here
}