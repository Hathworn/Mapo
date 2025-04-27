#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAdd(const float *A, const float *B, float *C, int numElements)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < numElements) 
    {
        // Optimize by using per-thread registers
        float a = A[i];
        float b = B[i];
        C[i] = a + b;
    }
}