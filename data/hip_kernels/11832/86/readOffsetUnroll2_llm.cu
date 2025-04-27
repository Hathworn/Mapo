#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void readOffsetUnroll2(float *A, float *B, float *C, const int n, int offset)
{
    unsigned int i = blockIdx.x * blockDim.x * 2 + threadIdx.x;
    unsigned int k = i + offset;

    // Optimize by reducing conditions and simplifying index calculations
    if (k < n)
    {
        C[i] = A[k] + B[k];
        if (k + blockDim.x < n) // Check boundary before the second assignment
        {
            C[i + blockDim.x] = A[k + blockDim.x] + B[k + blockDim.x];
        }
    }
}