#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeGlobalCol(float *in, float *out, const int nx, const int ny)
{
    // Calculate global thread indices
    unsigned int i = threadIdx.x + blockDim.x * blockIdx.x;
    unsigned int j = threadIdx.y + blockDim.y * blockIdx.y;

    // Use shared memory to optimize memory access
    __shared__ float tile[32][32 + 1]; // Use padding to avoid bank conflicts 

    if (i < nx && j < ny)
    {
        // Load data from global to shared memory
        tile[threadIdx.y][threadIdx.x] = in[i * ny + j];

        // Synchronize to ensure all loads are complete
        __syncthreads();

        // Write transposed data from shared to global memory
        out[j * nx + i] = tile[threadIdx.y][threadIdx.x];
    }
}