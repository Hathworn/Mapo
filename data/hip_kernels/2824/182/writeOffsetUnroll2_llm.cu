```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void writeOffsetUnroll2(float *A, float *B, float *C, const int n, int offset)
{
    unsigned int i = blockIdx.x * (blockDim.x * 2) + threadIdx.x; // Adjust calculation for loop unrolling
    unsigned int k = i + offset;

    if (k + blockDim.x < n)
    {
        float a0 = A[i];
        float b0 = B[i];
        float a1 = A[i + blockDim.x];
        float b1 = B[i + blockDim.x];
        
        C[k]            = a0 + b0;  // Use registers to reduce memory access
        C[k + blockDim.x] = a1 + b1;
    }
}