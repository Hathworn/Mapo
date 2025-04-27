#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeUnroll4Col(float *out, float *in, const int nx, const int ny)
{
    unsigned int ix = (blockDim.x * blockIdx.x + threadIdx.x) * 4; // Improved access pattern
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    if (ix < nx && iy < ny)
    {
        unsigned int ti = iy * nx + ix; // Access in rows
        unsigned int to = ix * ny + iy; // Access in columns

        // Unrolled memory transfer
        out[ti]                = in[to];
        out[ti +   blockDim.x] = in[to +   blockDim.x * ny];
        out[ti + 2 * blockDim.x] = in[to + 2 * blockDim.x * ny];
        out[ti + 3 * blockDim.x] = in[to + 3 * blockDim.x * ny];
    }
}