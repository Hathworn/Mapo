#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void vectorAdd(const float *A, const float *B, float *C, int numElements)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Use loop unrolling to process multiple elements per iteration
    if (i < numElements)
    {
        C[i] = A[i] + B[i];
    }
    i += blockDim.x * gridDim.x;
    if (i < numElements)
    {
        C[i] = A[i] + B[i];
    }
}