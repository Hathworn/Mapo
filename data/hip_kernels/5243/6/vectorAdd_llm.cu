#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAdd(int *A, int numElements)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Unroll loops to improve performance
    #pragma unroll
    for (int idx = i; idx < numElements; idx += blockDim.x * gridDim.x)
    {
        A[idx] = A[idx] * 2;
    }
}