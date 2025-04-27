#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumArraysZeroCopyWithUVAOffset(float *A, float *B, float *C, const int N, int offset)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int idx = i + offset;  // Pre-compute index with offset

    if (idx < N + offset)  // Adjust boundary condition
    {
        C[idx] = A[idx] + B[idx];  // Use pre-computed index
    }
}