#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernal1(int *A, int *B, int numElements)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    // Use strided access pattern to improve memory coalescing
    for (int idx = i; idx < numElements; idx += blockDim.x * gridDim.x)
    {
        B[idx] = A[idx] + B[idx];
    }
}