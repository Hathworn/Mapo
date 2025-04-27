#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void warmup(float *out, float *in, const int nx, const int ny)
{
    // Use shared memory for coalesced memory access
    __shared__ float tile[BLOCK_SIZE][BLOCK_SIZE];

    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    if (ix < nx && iy < ny)
    {
        // Load data from global to shared memory
        tile[threadIdx.y][threadIdx.x] = in[iy * nx + ix];
        __syncthreads();

        // Write data from shared to global memory
        out[iy * nx + ix] = tile[threadIdx.y][threadIdx.x];
    }
}