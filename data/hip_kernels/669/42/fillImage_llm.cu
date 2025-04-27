```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fillImage(int width, int height, int value, int* devOutput) {
    // Each thread calculates its own index
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Calculate the index only if the coordinates are within bounds
    if (x < width && y < height) {
        int index = y * width + x; // moved inside boundary check to reduce unnecessary calculations
        devOutput[index] = value;  // Set the pixel value
    }
}