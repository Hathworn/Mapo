#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeDiagonalRow(float *out, float *in, const int nx, const int ny)
{
    // Cache grid dimensions
    unsigned int gridDimX = gridDim.x;
    unsigned int gridDimY = gridDim.y;

    // Improved block indexing for better coalescing and access patterns
    unsigned int blk_x = blockIdx.x;
    unsigned int blk_y = (blockIdx.x + blockIdx.y) % gridDimY;

    // Calculate thread's output matrix row and column
    unsigned int ix = blockDim.x * blk_x + threadIdx.x;
    unsigned int iy = blockDim.y * blk_y + threadIdx.y;

    // Check bounds and transpose
    if (ix < nx && iy < ny)
    {
        out[ix * ny + iy] = in[iy * nx + ix];
    }
}