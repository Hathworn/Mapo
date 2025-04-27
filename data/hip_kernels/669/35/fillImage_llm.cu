#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fillImage(int width, int height, int value, int* devOutput) {
    int x = blockDim.x * blockIdx.x + threadIdx.x;
    int y = blockDim.y * blockIdx.y + threadIdx.y;
    
    // Precompute the index and check bounds only once
    if ((x < width) && (y < height)) {
        int index = y * width + x;
        devOutput[index] = value;
    }
}