#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function for filling an image with a value
__global__ void fillImage(int width, int height, int value, int* devOutput) {
    int x = blockDim.x * blockIdx.x + threadIdx.x;
    int y = blockDim.y * blockIdx.y + threadIdx.y;

    // Calculate the global index and check bounds
    if (x < width && y < height) {
        int index = y * width + x; // Calculate linear index only if necessary
        devOutput[index] = value;
    }
}