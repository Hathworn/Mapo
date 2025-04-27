#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeDiagonalRow(float *out, float *in, const int nx, const int ny)
{
    // Cache block index calculations
    unsigned int blkIdxX = blockIdx.x;
    unsigned int blkIdxY = blockIdx.y;
    unsigned int blk_x = (blkIdxX + blkIdxY) % gridDim.x;

    // Calculate global thread index
    unsigned int ix = blockDim.x * blk_x + threadIdx.x;
    unsigned int iy = blockDim.y * blkIdxX + threadIdx.y; // Correct block index for y

    // Check bounds and perform transpose
    if (ix < nx && iy < ny)
    {
        out[ix * ny + iy] = in[iy * nx + ix];
    }
}