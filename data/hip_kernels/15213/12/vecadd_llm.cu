#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void vecadd(int * v0, int * v1, std::size_t size)
{
    // Calculate the global thread index
    auto tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a stride loop to process multiple elements per thread
    for (std::size_t i = tid; i < size; i += blockDim.x * gridDim.x)
    {
        v0[i] += v1[i];
    }
}