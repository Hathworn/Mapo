#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuParallelSqrt(float *dist, int width, int pitch, int k) {
    // Calculate global index
    unsigned int xIndex = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int yIndex = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Calculate linear index and check bounds
    if (xIndex < width && yIndex < k) {
        unsigned int index = yIndex * pitch + xIndex;

        // Use in-place update
        dist[index] = sqrtf(dist[index]);
    }
}