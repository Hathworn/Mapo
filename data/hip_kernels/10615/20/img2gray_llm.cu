#include "hip/hip_runtime.h"
#include "includes.h"

#define RED 0
#define GREEN 1
#define BLUE 2

__global__ void img2gray(unsigned char *imageInput, int width, int height, unsigned char *imageOutput) {
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Calculate the index only once
    int idx = row * width + col;

    if (row < height && col < width) {
        // Use memory coalescing by accessing imageInput with a calculated offset
        unsigned char r = imageInput[idx * 3 + RED];
        unsigned char g = imageInput[idx * 3 + GREEN];
        unsigned char b = imageInput[idx * 3 + BLUE];

        // Direct writing to imageOutput
        imageOutput[idx] = static_cast<unsigned char>(r * 0.299f + g * 0.587f + b * 0.114f);
    }
}