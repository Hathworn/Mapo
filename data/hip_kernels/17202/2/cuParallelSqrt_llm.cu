#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cuParallelSqrt(float *dist, int width, int k) {
    unsigned int xIndex = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int yIndex = blockIdx.y * blockDim.y + threadIdx.y;
    // Use a single combined index for better memory access patterns
    unsigned int index = yIndex * width + xIndex;
    if (xIndex < width && yIndex < k) {
        // Save calculation of index in a variable, avoid recalculating.
        float value = dist[index];
        dist[index] = sqrt(value);
    }
}