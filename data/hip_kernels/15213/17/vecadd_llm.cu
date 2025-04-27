#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecadd(int *v0, int *v1, std::size_t size)
{
    // Calculate global thread index
    std::size_t tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Perform operation only if within bounds
    if (tid < size) {
        v0[tid] += v1[tid];
    }
}