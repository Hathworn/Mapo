#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void readOffsetUnroll4(float *A, float *B, float *C, const int n, int offset)
{
    unsigned int i = blockIdx.x * blockDim.x * 4 + threadIdx.x;
    unsigned int k = i + offset;

    // Use loop unrolling only when within bounds
    if (k < n)
    {
        #pragma unroll 4
        for (int j = 0; j < 4; j++)
        {
            if (k + j * blockDim.x < n)
            {
                C[i + j * blockDim.x] = A[k + j * blockDim.x] + B[k + j * blockDim.x];
            }
        }
    }
}