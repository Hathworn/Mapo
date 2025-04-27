#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeDiagonalRow(float *out, float *in, const int nx, const int ny)
{
    unsigned int blk_y = blockIdx.y; // Use blockIdx.y directly for better grid utilization
    unsigned int blk_x = blockIdx.x; // Use blockIdx.x directly for better grid utilization

    unsigned int ix = blockDim.x * blk_x + threadIdx.x;
    unsigned int iy = blockDim.y * blk_y + threadIdx.y;

    if (ix < nx && iy < ny)
    {
        out[ix * ny + iy] = in[iy * nx + ix];
    }
}