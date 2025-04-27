#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAddKernel(float* A, float* B, float* Result) {
    // Optimize kernel with bounds check
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    if (i < gridDim.x * blockDim.x) {
        Result[i] = A[i] + B[i];
    }
}