#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void writeOffsetUnroll2(float *A, float *B, float *C, const int n, int offset)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int k = i + offset;

    // Use warp-level computation with unrolling for better memory efficiency
    if (k + blockDim.x < n)
    {
        float a = A[i];
        float b = B[i];
        C[k] = a + b;

        a = A[i + blockDim.x];
        b = B[i + blockDim.x];
        C[k + blockDim.x] = a + b;
    }
}