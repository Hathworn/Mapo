#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void compute_sqrt(float *dist, int width, int pitch, int k) {
    // Use shared memory loading
    __shared__ float sharedMem[32];  // Adjust size based on blockDim

    unsigned int xIndex = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int yIndex = blockIdx.y * blockDim.y + threadIdx.y;

    if (xIndex < width && yIndex < k) {
        // Load data into shared memory
        sharedMem[threadIdx.x] = dist[yIndex * pitch + xIndex];

        __syncthreads();  // Synchronize threads

        // Compute sqrt using shared memory
        float val = sqrt(sharedMem[threadIdx.x]);

        // Write back to global memory
        dist[yIndex * pitch + xIndex] = val;
    }
}