#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transposeDiagonalCol(float *out, float *in, const int nx, const int ny)
{
    // Calculate block and thread indices
    unsigned int blk_y = blockIdx.x;
    unsigned int blk_x = (blockIdx.x + blockIdx.y) % gridDim.x;

    // Calculate global coordinates and check bounds
    unsigned int ix = blockDim.x * blk_x + threadIdx.x;
    unsigned int iy = blockDim.y * blk_y + threadIdx.y;

    // Use shared memory to optimize memory access patterns
    __shared__ float tile[BLOCK_SIZE][BLOCK_SIZE + 1]; // +1 to avoid bank conflict

    if (ix < nx && iy < ny)
    {
        tile[threadIdx.y][threadIdx.x] = in[ix * ny + iy]; // Load data into shared memory
    }
    __syncthreads();

    ix = blockDim.y * blk_y + threadIdx.x; // Transpose coordinates
    iy = blockDim.x * blk_x + threadIdx.y;

    if (ix < ny && iy < nx)
    {
        out[iy * nx + ix] = tile[threadIdx.x][threadIdx.y]; // Write transposed data from shared memory
    }
}