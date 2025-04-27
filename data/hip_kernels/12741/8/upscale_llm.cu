#include "hip/hip_runtime.h"
#include "includes.h"
__device__ int translate_idx(int ii, int d1, int d2, int d3, int scale_factor)
{
    int x, y, z, w;
    w = ii % d3;
    ii = ii/d3;
    z = ii % d2;
    ii = ii/d2;
    y = ii % d1;
    ii = ii/d1;
    x = ii;
    w = w/scale_factor;
    z = z/scale_factor;
    d2 /= scale_factor;
    d3 /= scale_factor;
    return (((x*d1+y)*d2)+z)*d3+w;
}

__global__ void upscale(float *input, float *output, long no_elements, int scale_factor, int d1, int d2, int d3)
{
    // Calculate global thread index in x and y dimensions
    long idx_x = threadIdx.x + blockIdx.x * blockDim.x;
    long idx_y = threadIdx.y + blockIdx.y * blockDim.y;
    // Calculate the 1D index from the 2D grid
    long ii = idx_x + idx_y * (blockDim.x * gridDim.x);
    if (ii >= no_elements) return; // Boundary check
    int ipidx = translate_idx(ii, d1, d2, d3, scale_factor);
    output[ii] = input[ipidx];
}