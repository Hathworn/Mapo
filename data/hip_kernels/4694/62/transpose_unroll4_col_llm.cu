#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transpose_unroll4_col(int * mat, int * transpose, int nx, int ny)
{
    // Calculate global thread position
    int ix = blockIdx.x * blockDim.x * 4 + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Linearized indices for read and write
    int ti = iy * nx + ix;
    int to = ix * ny + iy;

    // Check bounds only once to ensure all required elements are within range
    if (ix + 3 * blockDim.x < nx && iy < ny)
    {
        // Coalesced access for optimized memory read
        transpose[ti] = mat[to];
        transpose[ti + blockDim.x] = mat[to + blockDim.x * ny];
        transpose[ti + 2 * blockDim.x] = mat[to + 2 * blockDim.x * ny];
        transpose[ti + 3 * blockDim.x] = mat[to + 3 * blockDim.x * ny];
    }
}