#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeUnroll4Row(float *out, float *in, const int nx, const int ny)
{
    unsigned int ix = blockDim.x * blockIdx.x * 4 + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // Avoid repeated computation by storing common values
    unsigned int ti = iy * nx + ix;
    unsigned int to_base = ix * ny + iy;

    // Use shared memory for faster access
    __shared__ float tile[blockDim.y][blockDim.x * 4];

    if (ix + 3 * blockDim.x < nx && iy < ny)
    {
        tile[threadIdx.y][threadIdx.x] = in[ti];
        tile[threadIdx.y][threadIdx.x + blockDim.x] = in[ti + blockDim.x];
        tile[threadIdx.y][threadIdx.x + 2 * blockDim.x] = in[ti + 2 * blockDim.x];
        tile[threadIdx.y][threadIdx.x + 3 * blockDim.x] = in[ti + 3 * blockDim.x];
    }
    __syncthreads();

    if (ix + 3 * blockDim.x < nx && iy < ny)
    {
        out[to_base] = tile[threadIdx.y][threadIdx.x];
        out[to_base + ny * blockDim.x] = tile[threadIdx.y][threadIdx.x + blockDim.x];
        out[to_base + ny * 2 * blockDim.x] = tile[threadIdx.y][threadIdx.x + 2 * blockDim.x];
        out[to_base + ny * 3 * blockDim.x] = tile[threadIdx.y][threadIdx.x + 3 * blockDim.x];
    }
}