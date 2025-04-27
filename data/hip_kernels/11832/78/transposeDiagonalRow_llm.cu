#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeDiagonalRow(float *out, float *in, const int nx, const int ny)
{
    // Calculate transposed block index
    unsigned int blk_y = blockIdx.y;
    unsigned int blk_x = blockIdx.x;

    // Calculate the global thread coordinates
    unsigned int ix = blockDim.x * blk_x + threadIdx.x;
    unsigned int iy = blockDim.y * blk_y + threadIdx.y;

    // Perform the transpose operation when within bounds
    if (ix < nx && iy < ny)
    {
        out[iy + ix * ny] = in[ix + iy * nx];
    }
}