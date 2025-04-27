#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void imgGray(unsigned char * d_image, unsigned char* d_imagegray, int width, int height){
    
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    if (row < height && col < width) {
        int grayIdx = row * width + col;
        int colorIdx = grayIdx * 3;
        
        // Perform weighted sum directly using local variables
        unsigned char r = d_image[colorIdx];
        unsigned char g = d_image[colorIdx + 1];
        unsigned char b = d_image[colorIdx + 2];
        
        d_imagegray[grayIdx] = r * 0.114f + g * 0.587f + b * 0.299f; // Optimized for readability and efficiency
    }
}