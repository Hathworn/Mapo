#include "hip/hip_runtime.h"
#include "includes.h"

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

__global__ void upscale(float *input, float *output, long no_elements, int scale_factor, int d1, int d2, int d3)
{
    // Calculate the linear index using 3D blocks and threads
    long ii = blockIdx.x * blockDim.x + threadIdx.x;
    long blockIdyOffset = blockIdx.y * (blockDim.x * gridDim.x);
    long blockIdzOffset = blockIdx.z * (blockDim.x * gridDim.x * gridDim.y);
    ii += blockIdx.y * blockDim.y + threadIdx.y + blockIdyOffset;
    ii += blockIdx.z * blockDim.z + threadIdx.z + blockIdzOffset;

    // Boundary check
    if (ii >= no_elements) return;

    // Calculate source index and copy to output
    int ipidx = translate_idx(ii, d1, d2, d3, scale_factor);
    output[ii] = input[ipidx];
}