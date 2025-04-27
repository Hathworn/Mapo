#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeUnroll4Col(float *out, float *in, const int nx, const int ny)
{
    unsigned int ix = blockDim.x * blockIdx.x * 4 + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // Precompute values to avoid redundant calculations
    unsigned int blockOffset = blockDim.x * ny;
    unsigned int ti = iy * nx + ix; // access in rows
    unsigned int to = ix * ny + iy; // access in columns

    if (ix + 3 * blockDim.x < nx && iy < ny)
    {
        // Perform unrolled memory accesses efficiently
        out[ti]                = in[to];
        out[ti +   blockDim.x] = in[to +   blockOffset];
        out[ti + 2 * blockDim.x] = in[to + 2 * blockOffset];
        out[ti + 3 * blockDim.x] = in[to + 3 * blockOffset];
    }
}