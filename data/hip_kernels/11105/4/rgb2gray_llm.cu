#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rgb2gray(unsigned char* d_Pin, unsigned char* d_Pout, int width, int height) {
    int Row = blockIdx.y * blockDim.y + threadIdx.y;
    int Col = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for pixel RGB values to reduce global memory access
    __shared__ unsigned char shared_d_Pin[1024 * 3];  // adjust size according to block size

    if ((Row < height) && (Col < width)) {
        // Calculate linear thread index within the block
        int threadIdx_linear = threadIdx.y * blockDim.x + threadIdx.x;

        // Load pixel values into shared memory
        shared_d_Pin[threadIdx_linear * 3 + 0] = d_Pin[(Row * width + Col) * 3 + 0];
        shared_d_Pin[threadIdx_linear * 3 + 1] = d_Pin[(Row * width + Col) * 3 + 1];
        shared_d_Pin[threadIdx_linear * 3 + 2] = d_Pin[(Row * width + Col) * 3 + 2];

        __syncthreads();  // Ensure all threads have loaded their pixels

        // Use shared memory for computation
        d_Pout[Row * width + Col] = shared_d_Pin[threadIdx_linear * 3 + BLUE] * 0.114 +
                                    shared_d_Pin[threadIdx_linear * 3 + GREEN] * 0.587 +
                                    shared_d_Pin[threadIdx_linear * 3 + RED] * 0.299;
    }
}