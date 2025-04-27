#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void img2gray(unsigned char *imageInput, int width, int height, unsigned char *imageOutput) {
    // Use shared memory to reduce global memory access
    __shared__ unsigned char sharedInput[1024 * Channels]; // Adjust size according to block size and Channels
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int threadId = threadIdx.y * blockDim.x + threadIdx.x;

    if (row < height && col < width) {
        int pos = (row * width + col) * Channels;
        // Load data into shared memory
        sharedInput[threadId * Channels] = imageInput[pos];
        sharedInput[threadId * Channels + 1] = imageInput[pos + 1];
        sharedInput[threadId * Channels + 2] = imageInput[pos + 2];
        __syncthreads(); // Ensure all threads have loaded their part

        // Perform calculation in shared memory
        int grayPos = row * width + col;
        imageOutput[grayPos] = sharedInput[threadId * Channels + RED] * 0.299 +
                               sharedInput[threadId * Channels + GREEN] * 0.587 +
                               sharedInput[threadId * Channels + BLUE] * 0.114;
    }
}