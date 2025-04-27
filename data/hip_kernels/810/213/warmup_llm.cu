#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void warmup(float *out, float *in, const int nx, const int ny)
{
    // Use shared memory to improve memory access efficiency
    __shared__ float tile[TILE_WIDTH][TILE_WIDTH]; 

    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    if (ix < nx && iy < ny)
    {
        unsigned int idx = iy * nx + ix;
        tile[threadIdx.y][threadIdx.x] = in[idx]; // Load data into shared memory
        __syncthreads(); // Synchronize to ensure all threads have loaded their data

        out[idx] = tile[threadIdx.y][threadIdx.x]; // Write data from shared memory
    }
}