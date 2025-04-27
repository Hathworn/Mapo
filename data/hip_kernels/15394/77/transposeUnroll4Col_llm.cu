#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transposeUnroll4Col(float *out, float *in, const int nx, const int ny)
{
    unsigned int ix = blockDim.x * blockIdx.x * 4 + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    unsigned int ti = iy * nx + ix; // access in rows
    unsigned int to = ix * ny + iy; // access in columns

    // Use shared memory for coalesced memory access
    __shared__ float tile[4 * blockDim.x];

    if (ix + 3 * blockDim.x < nx && iy < ny)
    {
        tile[threadIdx.x] = in[to];
        tile[threadIdx.x + blockDim.x] = in[to + blockDim.x * ny];
        tile[threadIdx.x + 2 * blockDim.x] = in[to + 2 * blockDim.x * ny];
        tile[threadIdx.x + 3 * blockDim.x] = in[to + 3 * blockDim.x * ny];
    }
    __syncthreads();

    if (ix + 3 * blockDim.x < nx && iy < ny)
    {
        out[ti]                = tile[threadIdx.x];
        out[ti +   blockDim.x] = tile[threadIdx.x +   blockDim.x];
        out[ti + 2 * blockDim.x] = tile[threadIdx.x + 2 * blockDim.x];
        out[ti + 3 * blockDim.x] = tile[threadIdx.x + 3 * blockDim.x];
    }
}