#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuParallelSqrt(float *dist, int width, int pitch, int k){
    // Use shared memory to improve memory access efficiency
    __shared__ float tile[blockDim.y][blockDim.x];

    unsigned int xIndex = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int yIndex = blockIdx.y * blockDim.y + threadIdx.y;

    if (xIndex < width && yIndex < k) {
        // Load data into shared memory
        tile[threadIdx.y][threadIdx.x] = dist[yIndex * pitch + xIndex];
        __syncthreads();

        // Perform computation using shared memory
        tile[threadIdx.y][threadIdx.x] = sqrt(tile[threadIdx.y][threadIdx.x]);
        __syncthreads();

        // Store results back to global memory
        dist[yIndex * pitch + xIndex] = tile[threadIdx.y][threadIdx.x];
    }
}