#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transpose_smem_pad(int * in, int* out, int nx, int ny)
{
    __shared__ int tile[BDIMY][BDIMX + IPAD];

    int ix = blockDim.x * blockIdx.x + threadIdx.x;
    int iy = blockDim.y * blockIdx.y + threadIdx.y;

    if (ix < nx && iy < ny)
    {
        int in_index = iy * nx + ix;

        // Load input into shared memory
        tile[threadIdx.y][threadIdx.x] = in[in_index];
        __syncthreads();

        // Calculate transposed indices
        int out_ix = blockIdx.y * blockDim.y + threadIdx.x;
        int out_iy = blockIdx.x * blockDim.x + threadIdx.y;

        if (out_ix < ny && out_iy < nx) // Ensure indices are within bounds
        {
            int out_index = out_iy * ny + out_ix;
            out[out_index] = tile[threadIdx.x][threadIdx.y];
        }
    }
}