#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transposeDiagonalCol(float *out, float *in, const int nx, const int ny)
{
    // Calculate the linear index for blocks and threads
    unsigned int blk_id = blockIdx.y * gridDim.x + blockIdx.x;
    unsigned int th_id = threadIdx.y * blockDim.x + threadIdx.x;

    unsigned int ix = blk_id % gridDim.x * blockDim.x + threadIdx.x;
    unsigned int iy = blk_id / gridDim.x * blockDim.y + threadIdx.y;

    // Perform transpose only within bounds
    if (ix < nx && iy < ny)
    {
        out[iy * nx + ix] = in[ix * ny + iy];
    }
}