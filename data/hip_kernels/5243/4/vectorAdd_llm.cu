#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAdd(int *A, int numElements)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Unrolling the loop to improve performance
    int stride = gridDim.x * blockDim.x;
    for (; i < numElements; i += stride)
    {
        A[i] = A[i] * 2;
    }
}