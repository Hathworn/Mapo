#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAdd(const float *A, const float *B, float *C, int numElements)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure i is within bounds and process threads that fall within numElements
    if (i < numElements)
    {
        C[i] = A[i] + B[i];
    }
}