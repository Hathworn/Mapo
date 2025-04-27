#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transpose(double *in_d, double *out_d, int row, int col)
{
    // Using shared memory for coalesced access
    __shared__ double tile[32][32];

    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x < row && y < col) {
        tile[threadIdx.y][threadIdx.x] = in_d[x + row * y];
    }

    __syncthreads();

    x = blockIdx.y * blockDim.y + threadIdx.x; // Transpose indices
    y = blockIdx.x * blockDim.x + threadIdx.y;

    if (x < col && y < row) {
        out_d[y + col * x] = tile[threadIdx.x][threadIdx.y];
    }
}