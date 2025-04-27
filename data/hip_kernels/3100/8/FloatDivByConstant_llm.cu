#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FloatDivByConstant(float *A, float constant)
{
    // Calculate unique global thread ID
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x; 

    // Grid stride loop for larger arrays
    unsigned int stride = blockDim.x * gridDim.x;
    for (unsigned int i = tid; i < N; i += stride) 
    {
        A[i] = A[i] / constant; // Division operation
    }
}