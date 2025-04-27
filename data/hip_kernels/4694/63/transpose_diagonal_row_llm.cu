#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transpose_diagonal_row(int *mat, int *transpose, int nx, int ny)
{
    // Calculate index using threadIdx and blockIdx
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure index is within matrix bounds before transposing
    if (ix < nx && iy < ny)
    {
        transpose[iy * nx + ix] = mat[ix * ny + iy];
    }
}