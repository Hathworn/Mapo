#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeDiagonalRow(float *out, float *in, const int nx, const int ny)
{
    // Calculate unique block index for diagonal traversal
    unsigned int blk_x = blockIdx.x;
    unsigned int blk_y = blockIdx.y;

    unsigned int ix = blockDim.x * blk_x + threadIdx.x;
    unsigned int iy = blockDim.y * blk_y + threadIdx.y;

    // Ensure within bounds before writing
    if (ix < nx && iy < ny)
    {
        out[ix * ny + iy] = in[iy * nx + ix];
    }
}