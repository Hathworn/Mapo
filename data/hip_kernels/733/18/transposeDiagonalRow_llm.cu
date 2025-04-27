#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transposeDiagonalRow(float *out, float *in, const int nx, const int ny)
{
    // Calculate block index for diagonal using thread blocks
    unsigned int blk_x = blockIdx.x;
    unsigned int blk_y = blockIdx.y;

    // Compute global indices directly using block and thread indices
    unsigned int ix = blockDim.x * blk_x + threadIdx.x;
    unsigned int iy = blockDim.y * blk_y + threadIdx.y;

    // Perform transposition if within matrix boundaries
    if (ix < nx && iy < ny)
    {
        out[ix * ny + iy] = in[iy * nx + ix];
    }
}