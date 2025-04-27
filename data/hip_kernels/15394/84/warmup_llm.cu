#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void warmup(float *A, float *B, float *C, const int n, int offset)
{
    // Calculate global index directly
    unsigned int global_idx = blockIdx.x * blockDim.x + threadIdx.x + offset;

    // Use branchless operation by adding additional condition in the calculation
    C[global_idx - offset] = (global_idx < n) * (A[global_idx] + B[global_idx]);
}