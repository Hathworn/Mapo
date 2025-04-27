#include "hip/hip_runtime.h"
#include "includes.h"

#define IDX(X, Y, Z, W, D1, D2, D3) (((X) * (D1) + (Y)) * (D2) + (Z)) * (D3) + (W)

__device__ int translate_idx(int ii, int d1, int d2, int d3, int scale_factor)
{
    int x, y, z, w;
    w = ii % d3;
    ii /= d3;
    z = ii % d2;
    ii /= d2;
    y = ii % d1;
    ii /= d1;
    x = ii;
    w /= scale_factor;
    z /= scale_factor;
    d2 /= scale_factor;
    d3 /= scale_factor;
    return IDX(x, y, z, w, d1, d2, d3);
}

__global__ void upscale(float *input, float *output, long no_elements, int scale_factor, int d1, int d2, int d3)
{
    // Calculate global thread index
    long ii = threadIdx.x + blockDim.x * (blockIdx.x + gridDim.x * blockIdx.y);
    ii += threadIdx.y * blockDim.y * (blockDim.x * gridDim.x);

    // Check if the index is within the bounds
    if (ii >= no_elements) return;

    // Translate index and copy value
    int ipidx = translate_idx(ii, d1, d2, d3, scale_factor);
    output[ii] = input[ipidx];
}