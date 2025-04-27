#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void writeOffsetUnroll4(float *A, float *B, float *C, const int n, int offset)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int k = i + offset;

    // Use loop unrolling to minimize loop overhead and increase instruction-level parallelism
    #pragma unroll
    for (int j = 0; j < 4; j++)
    {
        int idx = k + j * blockDim.x;
        if (idx < n)
        {
            C[idx] = A[i + j * blockDim.x] + B[i + j * blockDim.x];
        }
    }
}