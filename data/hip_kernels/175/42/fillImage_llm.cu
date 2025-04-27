#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fillImage(int width, int height, int value, int* devOutput) {
    // Calculate a single linear index for the pixel to improve cache usage
    int index = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x + gridDim.x * blockDim.y * threadIdx.y;
    
    // Check the boundary condition and assign value
    if (index < width * height) {
        devOutput[index] = value;
    }
}