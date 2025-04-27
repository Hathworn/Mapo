#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int translate_idx(int ii, int d1, int d2, int d3, int d4, int scale_factor_t, int scale_factor_xy)
{
    int x, y, t, z, w;
    w = ii % d4;
    ii = ii / d4;
    z = ii % d3;
    ii = ii / d3;
    t = ii % d2;
    ii = ii / d2;
    y = ii % d1;
    ii = ii / d1;
    x = ii;
    w /= scale_factor_xy;  // Optimize division
    z /= scale_factor_xy;  // Optimize division
    t /= scale_factor_t;   // Optimize division
    d2 /= scale_factor_t;
    d3 /= scale_factor_xy;
    d4 /= scale_factor_xy;
    return (((((x * d1 + y) * d2) + t) * d3) + z) * d4 + w;
}

__global__ void upscale(float *input, float *output, long no_elements, int scale_factor_t, int scale_factor_xy, int d1, int d2, int d3, int d4)
{
    // Calculate unique global thread ID
    long ii = blockIdx.x * blockDim.x + threadIdx.x + (blockIdx.y * blockDim.y) * (blockDim.x * gridDim.x) + threadIdx.y * (blockDim.x * gridDim.x);
    if (ii >= no_elements) return;  // Exit if out of bounds

    int ipidx = translate_idx(ii, d1, d2, d3, d4, scale_factor_t, scale_factor_xy);  // Get input index
    output[ii] = input[ipidx];  // Transfer data
}