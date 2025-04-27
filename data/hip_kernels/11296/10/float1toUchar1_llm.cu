```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void float1toUchar1(float1 *inputImage, uchar1 *outputImage, int width, int height) {
    // Calculate the unique global thread ID
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    if (x < width && y < height) { // Ensure we are within image bounds
        int offset = y * width + x; // Calculate linear offset
        float1 pixelf = inputImage[offset];
        uchar1 pixel;
        pixel.x = static_cast<unsigned char>(pixelf.x); // Convert float to uchar
        outputImage[offset] = pixel; // Store the result
    }
}