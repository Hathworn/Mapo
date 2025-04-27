#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int translate_idx_inv(int ii, int d1, int d2, int d3, int scale_factor, int off_x, int off_y)
{
    int x, y, z, w;
    w = ii % d3;
    ii = ii / d3;
    z = ii % d2;
    ii = ii / d2;
    y = ii % d1;
    ii = ii / d1;
    x = ii;
    w = w * scale_factor + off_x;
    z = z * scale_factor + off_y;
    d2 *= scale_factor;
    d3 *= scale_factor;
    return (((x * d1 + y) * d2) + z) * d3 + w;
}

__device__ int translate_idx(int ii, int d1, int d2, int d3, int scale_factor)
{
    int x, y, z, w;
    w = ii % d3;
    ii = ii / d3;
    z = ii % d2;
    ii = ii / d2;
    y = ii % d1;
    ii = ii / d1;
    x = ii;
    w = w / scale_factor;
    z = z / scale_factor;
    d2 /= scale_factor;
    d3 /= scale_factor;
    return (((x * d1 + y) * d2) + z) * d3 + w;
}

__global__ void downscale(float *gradInput_data, float *gradOutput_data, long no_elements, int scale_factor, int d1, int d2, int d3)
{
    // Calculate unique thread index globally
    long ii = threadIdx.x + blockDim.x * blockIdx.x + 
              threadIdx.y * blockDim.x * gridDim.x + 
              blockIdx.y * blockDim.y * blockDim.x * gridDim.x;
    
    // Exit if index is out of bounds
    if (ii >= no_elements) return;
    
    // Use threadIdx for offset instead of loop counters
    int i = threadIdx.x % scale_factor;
    int j = threadIdx.y % scale_factor;
    
    // Compute input index
    int ipidx = translate_idx_inv(ii, d1, d2, d3, scale_factor, i, j);
    
    // Accumulate results directly without loops
    atomicAdd(&gradInput_data[ii], gradOutput_data[ipidx]);
}