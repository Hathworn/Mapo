#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeDiagonalCol(float *out, float *in, const int nx, const int ny)
{
    // Optimize block and grid setup for better memory coalescing and access patterns
    unsigned int blk_y = blockIdx.y;
    unsigned int blk_x = blockIdx.x;

    // Swap block dimension indexing to spread workload effectively
    unsigned int ix = blockDim.y * blk_x + threadIdx.y;
    unsigned int iy = blockDim.x * blk_y + threadIdx.x;

    // Check the bounds for the transposed indices
    if (ix < ny && iy < nx)
    {
        out[ix * nx + iy] = in[iy * ny + ix];
    }
}