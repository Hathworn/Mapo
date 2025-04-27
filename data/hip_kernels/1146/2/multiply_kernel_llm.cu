#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multiply_kernel(float* A, float* B, float* C, int N) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Only compute values within the array bounds
    if (i < N) {
        // Simple element-wise multiplication
        C[i] = A[i] * B[i];
    }
}