#include "hip/hip_runtime.h"
#include "includes.h"

#define BDIMX 16 // Define block dimension X
#define BDIMY 16 // Define block dimension Y

__global__ void transpose_smem(int *in, int *out, int nx, int ny)
{
    __shared__ int tile[BDIMY][BDIMX];

    // Calculate input indices
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Calculate transposed indices
    unsigned int transposed_ix = blockIdx.y * blockDim.y + threadIdx.x;
    unsigned int transposed_iy = blockIdx.x * blockDim.x + threadIdx.y;

    // Ensure indices are within bounds before accessing
    if (ix < nx && iy < ny)
    {
        // Load into shared memory
        tile[threadIdx.y][threadIdx.x] = in[iy * nx + ix];
    }

    // Synchronize threads to ensure all have loaded
    __syncthreads();

    // Output results to global memory if within bounds
    if (transposed_ix < ny && transposed_iy < nx)
    {
        out[transposed_iy * ny + transposed_ix] = tile[threadIdx.x][threadIdx.y];
    }
}