#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecadd(int *v0, int *v1, std::size_t size)
{
    // Calculate global thread index for larger vector sizes
    auto tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread index does not exceed vector size
    if (tid < size)
    {
        v0[tid] += v1[tid];
    }
}