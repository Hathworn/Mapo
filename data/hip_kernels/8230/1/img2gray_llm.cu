#include "hip/hip_runtime.h"
#include "includes.h"

#define RED 2
#define GREEN 1
#define BLUE 0

using namespace std;

extern "C"
__global__ void img2gray(unsigned char *imageInput, int width, int height, unsigned char *imageOutput){
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    if (row < height && col < width) {
        // Calculate linear index once to improve performance
        int index = row * width + col;
        int rgbIndex = index * 3;

        // Optimize by avoiding repeated calculation
        unsigned char r = imageInput[rgbIndex + RED];
        unsigned char g = imageInput[rgbIndex + GREEN];
        unsigned char b = imageInput[rgbIndex + BLUE];

        // Compute grayscale value
        imageOutput[index] = r * 0.299f + g * 0.587f + b * 0.114f;
    }
}