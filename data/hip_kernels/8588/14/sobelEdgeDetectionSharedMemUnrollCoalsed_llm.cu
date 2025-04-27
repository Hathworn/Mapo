#include "hip/hip_runtime.h"
#include "includes.h"

// Define TILESIZE constants for easy reuse
#define TILESIZE _TILESIZE_2
#define TILESIZE_SQUARE (_TILESIZE_2 * _TILESIZE_2)

// Optimized kernel for sobel edge detection
__global__ void sobelEdgeDetectionSharedMemUnrollCoalsed(int *input, int *output, int width, int height, int thresh) {
    __shared__ int shMem[4 * TILESIZE_SQUARE];

    int num = _UNROLL_;
    int size = num * TILESIZE;

    int i = blockIdx.x * (num * _TILESIZE_) + threadIdx.x;
    int j = blockIdx.y * (num * _TILESIZE_) + threadIdx.y;

    int xind = threadIdx.x;
    int yind = threadIdx.y;

    // Load data into shared memory
    for (int x = 0; x < num; x++) {
        for (int y = 0; y < num; y++) {
            int xOffset = x * (_TILESIZE_), yOffset = y * (_TILESIZE_);
            int sharedIndex = size * (yind + yOffset) + (xind + xOffset);
            int globalIndex = (j + yOffset) * width + (i + xOffset);
            shMem[sharedIndex] = input[globalIndex];
        }
    }

    __syncthreads();

    // Perform sobel operation only within valid range
    if (i < width - _TILESIZE_ && j < height - _TILESIZE_ && xind > 0 && yind > 0 && xind < (TILESIZE - 1) && yind < (TILESIZE - 1)) {
        for (int x = 0; x < num; x++) {
            for (int y = 0; y < num; y++) {
                int xOffset = x * _TILESIZE_, yOffset = y * _TILESIZE_;

                // Compute Sobel gradients
                int sum1 = shMem[(xind + 1 + xOffset) + size * (yind - 1 + yOffset)] - shMem[(xind - 1 + xOffset) + size * (yind - 1 + yOffset)]
                         + 2 * shMem[(xind + 1 + xOffset) + size * (yind + yOffset)] - 2 * shMem[(xind - 1 + xOffset) + size * (yind + yOffset)]
                         + shMem[(xind + 1 + xOffset) + size * (yind + 1 + yOffset)] - shMem[(xind - 1 + xOffset) + size * (yind + 1 + yOffset)];
                
                int sum2 = shMem[(xind - 1 + xOffset) + size * (yind - 1 + yOffset)] + 2 * shMem[(xind + xOffset) + size * (yind - 1 + yOffset)] + shMem[(xind + 1 + xOffset) + size * (yind - 1 + yOffset)]
                         - shMem[(xind - 1 + xOffset) + size * (yind + 1 + yOffset)] - 2 * shMem[(xind + xOffset) + size * (yind + 1 + yOffset)] - shMem[(xind + 1 + xOffset) + size * (yind + 1 + yOffset)];

                // Calculate magnitude
                int magnitude = sum1 * sum1 + sum2 * sum2;

                int index = (j + yOffset) * width + (i + xOffset);

                // Set output based on threshold
                output[index] = (magnitude > thresh) ? 255 : 0;
            }
        }
    }
}