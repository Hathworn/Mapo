#include "hip/hip_runtime.h"
#include "includes.h"

#ifndef _ICP_KERNEL_H_
#define _ICP_KERNEL_H_

#define TILE_WIDTH 256

#endif // #ifndef _ICP_KERNEL_H_

__global__ void CalculateTotalError(double * distance_d, int size_data)
{
    __shared__ double error_s[2 * TILE_WIDTH];
    unsigned int t = threadIdx.x;
    unsigned int start = 2 * blockDim.x * blockIdx.x;
    
    // Load data into shared memory with boundary checks
    error_s[t] = (start + t < size_data) ? distance_d[start + t] : 0.0;
    error_s[blockDim.x + t] = (start + blockDim.x + t < size_data) ? distance_d[start + blockDim.x + t] : 0.0;
    
    // Optimized reduction loop
    for (unsigned int stride = blockDim.x; stride > 0; stride >>= 1)
    {
        __syncthreads();
        if (t < stride)
        {
            error_s[t] += error_s[t + stride];
        }
    }
    
    // Write the result of this block to global memory
    if (t == 0)
    {
        distance_d[blockIdx.x] = error_s[0];
    }
}