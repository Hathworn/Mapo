#include "hip/hip_runtime.h"
#include "includes.h"

#define RED 0
#define GREEN 1
#define BLUE 2

__global__ void img2gray(unsigned char *imageInput, int width, int height, unsigned char *imageOutput) {
    // Use shared memory for performance improvement
    extern __shared__ unsigned char sharedMem[];
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int idx = row * width + col;
    
    if (row < height && col < width) {
        // Load pixel data into shared memory
        sharedMem[threadIdx.y * blockDim.x * 3 + threadIdx.x * 3 + RED] = imageInput[idx * 3 + RED];
        sharedMem[threadIdx.y * blockDim.x * 3 + threadIdx.x * 3 + GREEN] = imageInput[idx * 3 + GREEN];
        sharedMem[threadIdx.y * blockDim.x * 3 + threadIdx.x * 3 + BLUE] = imageInput[idx * 3 + BLUE];
        __syncthreads();

        // Calculate gray value from shared memory
        unsigned char red = sharedMem[threadIdx.y * blockDim.x * 3 + threadIdx.x * 3 + RED];
        unsigned char green = sharedMem[threadIdx.y * blockDim.x * 3 + threadIdx.x * 3 + GREEN];
        unsigned char blue = sharedMem[threadIdx.y * blockDim.x * 3 + threadIdx.x * 3 + BLUE];
        
        imageOutput[idx] = red * 0.299f + green * 0.587f + blue * 0.114f;
    }
}