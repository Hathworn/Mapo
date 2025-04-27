#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Unroll the loop to process multiple elements per thread
    for(int index = i; index < N; index += blockDim.x * gridDim.x)
    {
        X[index * INCX] += ALPHA; // Modify only targeted elements
    }
}