#include "hip/hip_runtime.h"
#include "includes.h"

// Constants used by the program
#define BLOCK_DIM                      16
#define DEBUG                          0

__global__ void cuParallelSqrt(float *dist, int width, int k) {
    // Calculate linear thread index to optimize global memory access
    unsigned int index = blockIdx.y * blockDim.y * width + blockIdx.x * blockDim.x + threadIdx.y * width + threadIdx.x;
    
    if (index < k * width) {
        dist[index] = sqrt(dist[index]);
    }
}