#include "hip/hip_runtime.h"
#include "includes.h"

// Constants used by the program
#define BLOCK_DIM 16
#define DEBUG 0

// Optimized kernel function
__global__ void cuParallelSqrt(float *dist, int width, int k) {
    unsigned int xIndex = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int yIndex = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Use single thread to process multiple elements if possible
    if (xIndex < width && yIndex < k) {
        int index = yIndex * width + xIndex;
        dist[index] = sqrt(dist[index]);
    }
}