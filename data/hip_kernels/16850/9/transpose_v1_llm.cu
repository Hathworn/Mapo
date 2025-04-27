#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transpose_v1(float* a, float* b, int n) {
    // Use shared memory for efficient access and reduce global memory accesses
    __shared__ float tile[32][32];

    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Load elements into shared memory tile
    if(x < n && y < n) {
        tile[threadIdx.y][threadIdx.x] = a[y * n + x];
    }
    
    __syncthreads(); // Ensure all threads have written to shared memory

    // Transpose and write back to global memory from shared memory tile
    x = blockIdx.y * blockDim.y + threadIdx.x;
    y = blockIdx.x * blockDim.x + threadIdx.y;

    if(x < n && y < n) {
        b[x * n + y] = tile[threadIdx.x][threadIdx.y];
    }
}