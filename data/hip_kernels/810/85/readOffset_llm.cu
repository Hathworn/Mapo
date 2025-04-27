#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void readOffset(float *A, float *B, float *C, const int n, int offset)
{
    // Calculate the global index only once
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int k = i + offset;

    // Use grid-stride loop to handle larger data
    for (; k < n; k += blockDim.x * gridDim.x)
    {
        C[k - offset] = A[k] + B[k];
    }
}