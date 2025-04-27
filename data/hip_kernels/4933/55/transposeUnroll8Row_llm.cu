#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeUnroll8Row(float *out, float *in, const int nx, const int ny)
{
    unsigned int ix = blockDim.x * blockIdx.x * 8 + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    unsigned int ti = iy * nx + ix; // access in rows
    unsigned int to = ix * ny + iy; // access in columns

    // Use shared memory to optimize memory access
    __shared__ float tile[8][8+1];

    if (ix + 7 * blockDim.x < nx && iy < ny)
    {
        #pragma unroll
        for (int i = 0; i < 8; i++)
        {
            tile[threadIdx.y][threadIdx.x + i * blockDim.x] = in[ti + i * blockDim.x];
        }
    }
    __syncthreads();

    ix = blockDim.y * blockIdx.y * 8 + threadIdx.x; // Transpose indexing
    iy = blockDim.x * blockIdx.x + threadIdx.y;

    if (ix < ny && iy + 7 * blockDim.y < nx)
    {
        #pragma unroll
        for (int i = 0; i < 8; i++)
        {
            out[to + i * blockDim.y] = tile[threadIdx.x][threadIdx.y + i];
        }
    }
}