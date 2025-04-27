#include "hip/hip_runtime.h"
#include "includes.h"

//=== Vector math (one argument) =============================================

__global__ void vec_erfcxf(size_t n, float *result, float *x)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    if (id < n)
    {
        // Use shared memory to reduce global memory access
        __shared__ float shared_x[256]; // Ensure the size fits within blockDim.x
        shared_x[threadIdx.x] = x[id];
        __syncthreads();

        // Compute result using shared memory and store back into global memory
        result[id] = erfcxf(shared_x[threadIdx.x]);
    }
}