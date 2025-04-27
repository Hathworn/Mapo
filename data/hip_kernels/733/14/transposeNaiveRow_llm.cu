#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transposeNaiveRow(float *out, float *in, const int nx, const int ny)
{
    // Use shared memory for faster access
    __shared__ float tile[32][33]; // 32x32 tile with padding to avoid bank conflicts

    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;
    
    if (ix < nx && iy < ny)
    {
        // Load data into shared memory
        tile[threadIdx.y][threadIdx.x] = in[iy * nx + ix];
    }
    __syncthreads();

    // Transpose and store to global memory
    ix = blockDim.y * blockIdx.y + threadIdx.x;
    iy = blockDim.x * blockIdx.x + threadIdx.y;

    if (ix < ny && iy < nx)
    {
        out[ix * nx + iy] = tile[threadIdx.x][threadIdx.y];
    }
}