#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAdd(const float *A, const float *B, float *C, int numElements)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use loop unrolling to process multiple elements per thread
    int step = blockDim.x * gridDim.x;
    
    for(; i < numElements; i += step)
    {
        C[i] = A[i] + B[i];
    }
}