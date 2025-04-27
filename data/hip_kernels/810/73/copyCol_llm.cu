#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyCol(float *out, float *in, const int nx, const int ny)
{
    // Use shared memory for better performance
    extern __shared__ float tile[];

    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    if (ix < nx && iy < ny)
    {
        // Load input data into shared memory
        tile[threadIdx.y * blockDim.x + threadIdx.x] = in[ix * ny + iy];
        __syncthreads();

        // Copy data from shared memory to output
        out[ix * ny + iy] = tile[threadIdx.y * blockDim.x + threadIdx.x];
    }
}