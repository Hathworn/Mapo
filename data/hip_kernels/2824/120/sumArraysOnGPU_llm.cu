#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArraysOnGPU(float *A, float *B, float *C, const int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use memory access coalescing
    int stride = gridDim.x * blockDim.x;
    for (int index = i; index < N; index += stride)
    {
        C[index] = A[index] * B[index];
    }
}