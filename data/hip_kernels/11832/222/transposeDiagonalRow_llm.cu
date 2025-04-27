#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transposeDiagonalRow(float *out, float *in, const int nx, const int ny)
{
    // Calculate the unique block index using blockIdx.y to improve memory access pattern
    unsigned int blk_x = blockIdx.x;
    unsigned int blk_y = blockIdx.y;

    // Compute the global thread coordinates
    unsigned int ix = blockDim.x * blk_x + threadIdx.x;
    unsigned int iy = blockDim.y * blk_y + threadIdx.y;

    // Check if within bounds before accessing memory
    if (ix < nx && iy < ny)
    {
        // Perform the diagonal transpose efficiently
        out[ix * ny + iy] = in[iy * nx + ix];
    }
}