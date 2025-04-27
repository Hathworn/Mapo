#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transposeDiagonalCol(float *out, float *in, const int nx, const int ny)
{
    // Calculate transposed block coordinates
    unsigned int blk_x = blockIdx.x;
    unsigned int blk_y = blockIdx.y;

    // Calculate transposed global thread coordinates
    unsigned int ix = blockDim.x * blk_x + threadIdx.x;
    unsigned int iy = blockDim.y * blk_y + threadIdx.y;

    // Ensure indices are within bounds
    if (ix < nx && iy < ny)
    {
        // Transpose and write the output
        out[iy * nx + ix] = in[ix * ny + iy];
    }
}