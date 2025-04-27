#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VecAdd(const float* __restrict__ A, const float* __restrict__ B, float* __restrict__ C, int N)
{
    // Calculate the global thread index
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Process multiple elements per thread to reduce global memory transactions
    int stride = gridDim.x * blockDim.x;
    
    for (int index = i; index < N; index += stride) {
        C[index] = A[index] + B[index];
    }
}