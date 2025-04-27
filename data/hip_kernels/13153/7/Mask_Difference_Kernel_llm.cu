#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Mask_Difference_Kernel(int* A, int* B, int* devOut) {
    const int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Simplified without conditional branching
    devOut[idx] = (A[idx] != B[idx]);
}