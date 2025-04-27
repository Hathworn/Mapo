#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void readOffset(float *A, float *B, float *C, const int n, int offset)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int k = i + offset;

    // Unroll loop to improve memory access pattern
    if (k < n)
    {
        C[i] = A[k] + B[k];

        // Preloading next elements to avoid multiple condition checks
        if((k + blockDim.x) < n)
            C[i + blockDim.x] = A[k + blockDim.x] + B[k + blockDim.x];
    }
}