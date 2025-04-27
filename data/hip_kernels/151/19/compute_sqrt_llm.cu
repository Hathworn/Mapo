#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void compute_sqrt(float *dist, int width, int pitch, int k) {
    unsigned int xIndex = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int yIndex = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure thread indices are within bounds
    if (xIndex < width && yIndex < k) {
        unsigned int index = yIndex * pitch + xIndex;

        // Load from global memory, compute sqrt and store back
        float val = dist[index];
        dist[index] = sqrtf(val); // Use sqrtf for single precision
    }
}