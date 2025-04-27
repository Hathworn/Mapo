#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeNaiveRow(float *out, float *in, const int nx, const int ny)
{
    // Utilize shared memory to reduce global memory access
    __shared__ float tile[32][32 + 1]; // Padding to prevent bank conflicts

    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    if (ix < nx && iy < ny)
    {
        tile[threadIdx.y][threadIdx.x] = in[iy * nx + ix];
    }
    __syncthreads();

    ix = blockIdx.y * blockDim.y + threadIdx.x; // Transpose access pattern
    iy = blockIdx.x * blockDim.x + threadIdx.y;

    if (ix < ny && iy < nx)
    {
        out[iy * ny + ix] = tile[threadIdx.x][threadIdx.y];
    }
}