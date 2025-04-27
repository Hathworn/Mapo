#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transpose_read_column_write_row(int *mat, int *transpose, int nx, int ny)
{
    // Use shared memory for better performance
    __shared__ int tile[32][32 + 1]; // Add padding to avoid bank conflicts

    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Transpose using shared memory to reduce global memory accesses
    if (ix < nx && iy < ny)
    {
        tile[threadIdx.y][threadIdx.x] = mat[ix * ny + iy];
    }

    __syncthreads();

    ix = blockIdx.y * blockDim.y + threadIdx.x; // Transpose block offset
    iy = blockIdx.x * blockDim.x + threadIdx.y;

    if (ix < ny && iy < nx)
    {
        transpose[iy * ny + ix] = tile[threadIdx.x][threadIdx.y];
    }
}