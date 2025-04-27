#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Mask_Subtract_Kernel(int* A, int* B, int* devOut)
{
    const int idx = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Use ternary operator for conditional assignment
    devOut[idx] = (B[idx] == 0) ? A[idx] : 0;
}