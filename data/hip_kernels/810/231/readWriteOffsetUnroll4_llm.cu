#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void readWriteOffsetUnroll4(float *A, float *B, float *C, const int n, int offset)
{
    unsigned int i = blockIdx.x * blockDim.x * 4 + threadIdx.x;
    unsigned int k = i + offset;

    // Use loop unrolling for reduced loop overhead and better pipelining
    #pragma unroll
    for (int j = 0; j < 4; ++j)
    {
        if (k + j * blockDim.x < n)
        {
            C[k + j * blockDim.x] = A[k + j * blockDim.x] + B[k + j * blockDim.x];
        }
    }
}