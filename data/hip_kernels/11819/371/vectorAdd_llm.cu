#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAdd(const float * __restrict__ A, const float * __restrict__ B, float * __restrict__ C, int numElements)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i < numElements)
    {
        C[i] = __ldg(&A[i]) + __ldg(&B[i]);  // Use __ldg for read-only data
    }
}