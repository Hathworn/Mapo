#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAdd(const float *A, const float *B, float *C, int numElements)
{
    // Calculate global thread index
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure to use only threads corresponding to valid indices
    if (i < numElements)
    {
        C[i] = A[i] + B[i];
    }
}