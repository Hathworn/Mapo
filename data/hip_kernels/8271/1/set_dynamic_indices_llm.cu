#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_dynamic_indices(unsigned int *d_all_ib, unsigned int *d_ib, int flip)
{
    if (flip == blockIdx.x)
    {
        // Calculate global thread index once to avoid redundant calculations
        int globalIdx = blockDim.x * blockIdx.x + threadIdx.x;
        
        // Use a single read and write to reduce global memory accesses
        unsigned int value = d_all_ib[globalIdx];
        d_ib[threadIdx.x] = value;
        d_ib[3 + threadIdx.x] = 0;
    }
}