#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyGmem(float *out, float *in, const int nx, const int ny)
{
    // Using shared memory for faster access
    extern __shared__ float tile[];

    // Matrix coordinate (ix, iy)
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int idx = iy * nx + ix;

    // Load data into shared memory with boundary test
    if (ix < nx && iy < ny)
    {
        tile[threadIdx.y * blockDim.x + threadIdx.x] = in[idx];
    }
    __syncthreads();

    // Write back from shared memory to global memory
    if (ix < nx && iy < ny)
    {
        out[idx] = tile[threadIdx.y * blockDim.x + threadIdx.x];
    }
}