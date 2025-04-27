#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sobelEdgeDetectionSharedMemOverlap(int *input, int *output, int width, int height, int thresh) {

    // Define shared memory
    __shared__ int shMem[_TILESIZE_2 * _TILESIZE_2];
    
    int blocksize = _TILESIZE_2;
    int i = blockIdx.x * _TILESIZE_ + threadIdx.x;
    int j = blockIdx.y * _TILESIZE_ + threadIdx.y;
    int index = j * width + i;

    int xind = threadIdx.x;
    int yind = threadIdx.y;

    // Load data to shared memory, check bounds
    if (i < width && j < height) {
        shMem[blocksize * yind + xind] = input[index];
    }
    __syncthreads();

    // Ensure valid thread indices for computation
    if(xind > 0 && yind > 0 && xind < blocksize - 1 && yind < blocksize - 1) {
        // Perform Sobel operation in shared memory
        int sum1 = shMem[xind + 1 + blocksize * (yind - 1)] - shMem[xind - 1 + blocksize * (yind - 1)]
                 + 2 * shMem[xind + 1 + blocksize * yind] - 2 * shMem[xind - 1 + blocksize * yind]
                 + shMem[xind + 1 + blocksize * (yind + 1)] - shMem[xind - 1 + blocksize * (yind + 1)];
                 
        int sum2 = shMem[xind - 1 + blocksize * (yind - 1)] + 2 * shMem[xind + blocksize * (yind - 1)] + shMem[xind + 1 + blocksize * (yind - 1)]
                 - shMem[xind - 1 + blocksize * (yind + 1)] - 2 * shMem[xind + blocksize * (yind + 1)] - shMem[xind + 1 + blocksize * (yind + 1)];
        
        int magnitude = sum1 * sum1 + sum2 * sum2;
        // Output result based on threshold
        if (i < width && j < height) {
            output[index] = (magnitude > thresh) ? 255 : 0;
        }
    }
}