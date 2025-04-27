#include "hip/hip_runtime.h"
#include "includes.h"

#define RED 0
#define GREEN 1
#define BLUE 2

__global__ void img2gray(unsigned char *imageInput, int width, int height, unsigned char *imageOutput) {
    // Calculate pixel position using thread and block indices
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to load pixel data for faster access
    __shared__ unsigned char sharedImage[1024]; // Adjust size based on block dimensions

    int imgIndex = (row * width + col) * 3;

    // Load pixel data into shared memory
    if ((row < height) && (col < width)) {
        sharedImage[threadIdx.y * blockDim.x + threadIdx.x] = imageInput[imgIndex + RED] * 0.299
                                                               + imageInput[imgIndex + GREEN] * 0.587
                                                               + imageInput[imgIndex + BLUE] * 0.114;
        __syncthreads();

        // Write grayscale value to output
        imageOutput[row * width + col] = sharedImage[threadIdx.y * blockDim.x + threadIdx.x];
    }
}