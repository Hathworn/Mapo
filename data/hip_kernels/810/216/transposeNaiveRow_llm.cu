#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeNaiveRow(float *out, float *in, const int nx, const int ny)
{
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    if (ix < nx && iy < ny)
    {
        // Optimize memory access by loading a tile into shared memory
        __shared__ float tile[32][32];

        unsigned int tidx = threadIdx.x;
        unsigned int tidy = threadIdx.y;

        // Load data into shared memory
        tile[tidy][tidx] = in[iy * nx + ix];
        __syncthreads();

        // Transpose and write back to global memory
        out[ix * ny + iy] = tile[tidx][tidy];
    }
}