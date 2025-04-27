#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Mask_Union_Kernel(int* A, int* B, int* devOut) {
    const int idx = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Use ternary operator for concise conditional assignment
    devOut[idx] = (A[idx] + B[idx] > 0) ? 1 : 0;
}