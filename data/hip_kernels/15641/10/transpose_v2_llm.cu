#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transpose_v2(float* a, float* b, int n) {
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int bx = blockIdx.x;
    int by = blockIdx.y;

    // Calculate global indices
    int i = bx * BX + tx;
    int j = by * BY + ty;

    __shared__ float tile[BY][BX];

    // Check against bounds and load tile
    if (i < n && j < n) {
        tile[ty][tx] = a[j * n + i];
    }

    __syncthreads();

    // Transpose write
    i = by * BY + tx;
    j = bx * BX + ty;

    // Check against bounds before writing
    if (i < n && j < n) {
        b[j * n + i] = tile[tx][ty];
    }
}