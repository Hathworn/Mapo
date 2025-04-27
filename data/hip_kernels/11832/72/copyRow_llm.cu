#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyRow(float *out, float *in, const int nx, const int ny)
{
    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // Using shared memory to optimize memory accesses
    __shared__ float tile[BLOCK_SIZE_Y][BLOCK_SIZE_X];

    if (ix < nx && iy < ny)
    {
        tile[threadIdx.y][threadIdx.x] = in[iy * nx + ix];
        __syncthreads(); // Ensure all threads have copied their data

        out[iy * nx + ix] = tile[threadIdx.y][threadIdx.x];
    }
}