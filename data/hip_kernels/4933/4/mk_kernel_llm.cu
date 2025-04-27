#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mk_kernel(char* keep_mem, size_t bytes)
{
    // Calculate global thread index
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use each thread to initialize one element if within bounds
    if (idx < bytes)
    {
        keep_mem[idx] = 0;
    }
}