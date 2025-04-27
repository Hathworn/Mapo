#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposedMatrixKernel(int* d_a, int* d_b) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int j = threadIdx.y + blockDim.y * blockIdx.y;

    // Use shared memory for better memory latency and coalesced access
    __shared__ int tile[TILE_SIZE][TILE_SIZE + 1];

    while (i < N) {
        j = threadIdx.y + blockDim.y * blockIdx.y;
        while (j < N) {
            // Load data into shared memory
            tile[threadIdx.y][threadIdx.x] = d_a[j * N + i];
            __syncthreads();

            // Write transposed data from shared memory to global memory
            d_b[i * N + j] = tile[threadIdx.x][threadIdx.y];
            __syncthreads();
            
            j += blockDim.y * gridDim.y;
        }
        i += blockDim.x * gridDim.x;
    }
}