#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sobelEdgeDetectionSharedMemUnrollControlFlow(int *input, int *output, int width, int height, int thresh) {

    unsigned int blockSize = 32;
    static __shared__ int shMem[34][34];

    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;
    
    int xind = threadIdx.x + 1;
    int yind = threadIdx.y + 1;

    // Load the central pixel
    if (i < width && j < height) {
        shMem[xind][yind] = input[width * j + i];
    }
    
    // Load border pixels using boundary checks to avoid control flow
    if (threadIdx.x == 0 && i - 1 >= 0) {
        shMem[xind - 1][yind] = input[width * j + i - 1];
    }
    if (threadIdx.x == blockDim.x - 1 && i + 1 < width) {
        shMem[xind + 1][yind] = input[width * j + i + 1];
    }
    if (threadIdx.y == 0 && j - 1 >= 0) {
        shMem[xind][yind - 1] = input[width * (j - 1) + i];
    }
    if (threadIdx.y == blockDim.y - 1 && j + 1 < height) {
        shMem[xind][yind + 1] = input[width * (j + 1) + i];
    }
    
    __syncthreads();

    int sum1 = 0, sum2 = 0, magnitude;

    // Apply the Sobel filter only within valid pixel range
    if (i > 0 && j > 0 && i < width - 1 && j < height - 1) {
        sum1 = shMem[xind + 1][yind - 1] - shMem[xind - 1][yind - 1]
             + 2 * shMem[xind + 1][yind] - 2 * shMem[xind - 1][yind]
             + shMem[xind + 1][yind + 1] - shMem[xind - 1][yind + 1];

        sum2 = shMem[xind - 1][yind - 1] + 2 * shMem[xind][yind - 1] + shMem[xind + 1][yind - 1]
             - shMem[xind - 1][yind + 1] - 2 * shMem[xind][yind + 1] - shMem[xind + 1][yind + 1];

        magnitude = sum1 * sum1 + sum2 * sum2;

        // Threshold check with shared memory results
        output[width * j + i] = (magnitude > thresh) ? 255 : 0;
    }
}