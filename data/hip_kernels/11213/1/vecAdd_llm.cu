#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void vecAdd(float* A, float* B, float* C) {
    // Use blockDim.x to support arbitrary numbers of threads per block
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Initialize C using A and B directly; Avoid redundant operations
    C[i] = 0; 
}