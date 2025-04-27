```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define RED 0
#define GREEN 1
#define BLUE 2

__global__ void PictureKernell(unsigned char *imageInput, int width, int height, unsigned char *imageOutput) {
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if the thread is within image bounds
    if (row < height && col < width) {
        int idx = (row * width + col) * 3;  // Calculate 1D index for 3-channel image
        // Grayscale conversion with fixed point arithmetic
        imageOutput[row * width + col] = imageInput[idx + RED] * 0.299f + 
                                         imageInput[idx + GREEN] * 0.587f + 
                                         imageInput[idx + BLUE] * 0.114f;
    }
}
```
