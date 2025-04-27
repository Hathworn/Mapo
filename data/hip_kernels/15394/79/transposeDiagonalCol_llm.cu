#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transposeDiagonalCol(float *out, float *in, const int nx, const int ny)
{
    // Calculate unique block index
    unsigned int blk_x = blockIdx.x;
    unsigned int blk_y = blockIdx.y;

    // Calculate global thread indices
    unsigned int ix = blockDim.x * blk_x + threadIdx.x;
    unsigned int iy = blockDim.y * blk_y + threadIdx.y;

    // Ensure within bounds
    if (ix < nx && iy < ny)
    {
        // Perform the transpose
        out[iy * nx + ix] = in[ix * ny + iy];
    }
}