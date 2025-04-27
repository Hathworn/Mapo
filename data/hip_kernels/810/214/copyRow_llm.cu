#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyRow(float *out, float *in, const int nx, const int ny)
{
    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // Optimize memory access by using shared memory
    __shared__ float tile[TILE_DIM][TILE_DIM];

    if (ix < nx && iy < ny)
    {
        // Load input into shared memory
        tile[threadIdx.y][threadIdx.x] = in[iy * nx + ix];
        __syncthreads();

        // Write output from shared memory
        out[iy * nx + ix] = tile[threadIdx.y][threadIdx.x];
    }
}