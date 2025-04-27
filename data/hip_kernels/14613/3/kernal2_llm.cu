#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernal2(int *A, int k, int numElements)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    // Use loop unrolling to optimize memory access
    int stride = gridDim.x * blockDim.x;
    for (int idx = i; idx < numElements; idx += stride)
    {
        A[idx] = A[idx] * k;
    }
}