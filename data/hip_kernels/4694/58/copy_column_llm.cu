#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_column(int *mat, int *transpose, int nx, int ny)
{
    // Calculate single unique index for 2D grid
    int idx = blockIdx.y * blockDim.y + threadIdx.y;
    if (idx >= ny) return;  // Early exit if out of bounds on y-dimension

    int idy = blockIdx.x * blockDim.x + threadIdx.x;
    if (idy >= nx) return;  // Early exit if out of bounds on x-dimension

    // Efficient memory access with 1D index
    transpose[idy * ny + idx] = mat[idy * ny + idx];
}