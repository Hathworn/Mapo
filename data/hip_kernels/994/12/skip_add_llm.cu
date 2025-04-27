#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize memory access and occupancy
__global__ void skip_add(size_t sz, const float_t* __restrict__ f1, float* __restrict__ skip_out_sum)
{
    // Calculate unique thread index
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;

    // Check boundary condition and perform the addition
    if(index < sz)
    {
        skip_out_sum[index] += f1[index];
    }
}