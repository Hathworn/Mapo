#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpuTranspose(float *a, float *b, int m, int n) {
    // Utilize shared memory for coalesced memory access
    __shared__ float tile[32][32 + 1]; // Padding to avoid bank conflicts

    uint xIndex = blockDim.x * blockIdx.x + threadIdx.x;
    uint yIndex = blockDim.y * blockIdx.y + threadIdx.y;

    if (xIndex < n && yIndex < m) {
        // Load from global memory to shared memory
        tile[threadIdx.y][threadIdx.x] = a[yIndex * n + xIndex];
    }

    __syncthreads();

    xIndex = blockDim.x * blockIdx.y + threadIdx.x; // Transpose block offset
    yIndex = blockDim.y * blockIdx.x + threadIdx.y;

    if (xIndex < m && yIndex < n) {
        // Write from shared memory to global memory
        b[yIndex * m + xIndex] = tile[threadIdx.x][threadIdx.y];
    }
}