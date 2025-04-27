#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized transposeDiagonalCol kernel function
__global__ void transposeDiagonalCol(float *out, float *in, const int nx, const int ny)
{
    unsigned int blk_x = blockIdx.x;
    unsigned int blk_y = blockIdx.y;

    unsigned int ix = blockDim.x * blk_x + threadIdx.x;
    unsigned int iy = blockDim.y * blk_y + threadIdx.y;

    // Combined block and thread indices for better access pattern
    if (ix < nx && iy < ny)
    {
        out[iy * nx + ix] = in[ix * ny + iy];
    }
}