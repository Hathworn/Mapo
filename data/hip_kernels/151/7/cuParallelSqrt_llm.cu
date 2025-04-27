#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuParallelSqrt(float *dist, int width, int pitch, int k) {
    unsigned int xIndex = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int yIndex = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Check if within bounds
    if (xIndex < width && yIndex < k) {
        // Use registers for repeated access
        unsigned int index = yIndex * pitch + xIndex;
        float value = dist[index];
        dist[index] = sqrt(value);
    }
}