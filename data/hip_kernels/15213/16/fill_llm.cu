#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill(int* v, std::size_t size)
{
    // Compute global thread ID
    auto tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure within bounds
    if (tid < size)
    {
        // Fill the array element
        v[tid] = tid;
    }
}