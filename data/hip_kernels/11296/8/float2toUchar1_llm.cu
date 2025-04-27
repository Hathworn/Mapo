#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void float2toUchar1(float2 *inputImage, uchar1 *outputImage, int width, int height, int index) {
    // Optimize thread offset computation for 1D grid
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    if (col < width && row < height) {  // Ensure within image boundaries
        int offset = row * width + col;
        float2 pixelf = inputImage[offset];
        float pixelfIndexed = (index == 0) ? pixelf.x : pixelf.y;
        uchar1 pixel;
        pixel.x = (unsigned char)pixelfIndexed;
        outputImage[offset] = pixel;
    }
}