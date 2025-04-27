#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeNaiveCol(float *out, float *in, const int nx, const int ny)
{
    // Use shared memory to reduce global memory accesses
    __shared__ float tile[32][32 + 1]; // Add padding to avoid bank conflicts

    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    if (ix < nx && iy < ny)
    {
        // Load from global memory to shared memory
        tile[threadIdx.y][threadIdx.x] = in[ix * ny + iy];
    }
    __syncthreads();

    // Transpose within shared memory and write back to global memory
    ix = blockDim.y * blockIdx.y + threadIdx.x; // swap x and y for the transposed position
    iy = blockDim.x * blockIdx.x + threadIdx.y;

    if (ix < ny && iy < nx)
    {
        out[iy * ny + ix] = tile[threadIdx.x][threadIdx.y];
    }
}