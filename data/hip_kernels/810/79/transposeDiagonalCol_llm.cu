#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeDiagonalCol(float *out, float *in, const int nx, const int ny)
{
    unsigned int blk_y = blockIdx.y; // Use blockIdx.y directly for clarity
    unsigned int blk_x = (blockIdx.x + blockIdx.y) % gridDim.x;

    unsigned int ix = blockDim.x * blk_x + threadIdx.x;
    unsigned int iy = blockDim.y * blk_y + threadIdx.y;

    // Combine boundary check in one line for better performance
    if (ix < nx && iy < ny)
    {
        // Swap ix and iy in accessing 'in' to handle column-major access more efficiently
        out[iy * nx + ix] = in[iy * ny + ix];
    }
}