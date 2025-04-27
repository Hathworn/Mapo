#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeUnroll4Row(float *out, float *in, const int nx, const int ny)
{
    // Optimize by using registers and reducing redundant calculations
    unsigned int ix = blockDim.x * blockIdx.x * 4 + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    if (ix + 3 * blockDim.x < nx && iy < ny)
    {
        unsigned int ti = iy * nx + ix; // Compute once
        unsigned int to = ix * ny + iy; // Compute once

        float inVal0 = in[ti];
        float inVal1 = in[ti + blockDim.x];
        float inVal2 = in[ti + 2 * blockDim.x];
        float inVal3 = in[ti + 3 * blockDim.x];

        out[to]                   = inVal0;
        out[to + ny * blockDim.x]   = inVal1;
        out[to + ny * 2 * blockDim.x] = inVal2;
        out[to + ny * 3 * blockDim.x] = inVal3;
    }
}