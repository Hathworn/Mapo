#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transpose_v4(float* a, float* b, int n) {
    // Improved blockIdx calculation for better warp utilization
    int blockIdx_x = blockIdx.y;
    int blockIdx_y = (blockIdx.x + blockIdx.y) % gridDim.x;

    int tx = threadIdx.x;
    int ty = threadIdx.y;

    int bx = blockIdx_x;
    int by = blockIdx_y;

    int i = bx * BX + tx;
    int j = by * BY + ty;

    // Use shared memory to reduce global memory access latency
    __shared__ float tile[BY][BX + 1]; // Minor modification to prevent bank conflict

    // Boundary check
    if (i < n && j < n) {
        tile[ty][tx] = a[j * n + i];
    }

    __syncthreads();

    // Transpose and write back with adjusted indices
    i = by * BY + tx;
    j = bx * BX + ty;

    // Boundary check for writing
    if (i < n && j < n) {
        b[j * n + i] = tile[tx][ty];
    }
}