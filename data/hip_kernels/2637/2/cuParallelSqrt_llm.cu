#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_DIM                      16
#define DEBUG                          0

__global__ void cuParallelSqrt(float *dist, int width, int k) {
    // Calculate the global index for the current thread
    unsigned int idx = blockIdx.y * width + blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if the index is within the valid range
    if (idx < k * width) {
        // Compute the square root of the element at the calculated index
        dist[idx] = sqrt(dist[idx]);
    }
}