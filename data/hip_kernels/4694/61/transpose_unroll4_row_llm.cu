#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transpose_unroll4_row(int *mat, int *transpose, int nx, int ny) {
    // Calculate row and column index
    int ix = blockIdx.x * blockDim.x * 4 + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Calculate linear index for input and output matrices
    int ti = iy * nx + ix;
    int to = ix * ny + iy;

    // Boundary check to ensure threads within matrix dimensions
    if (ix + 3 * blockDim.x < nx && iy < ny) {
        // Unroll the loop manually for better performance
        transpose[to]                     = mat[ti];
        transpose[to + ny * blockDim.x]   = mat[ti + blockDim.x];
        transpose[to + ny * 2 * blockDim.x] = mat[ti + 2 * blockDim.x];
        transpose[to + ny * 3 * blockDim.x] = mat[ti + 3 * blockDim.x];
    }
}