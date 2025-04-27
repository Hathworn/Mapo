```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void imageBlurKernel(unsigned char* d_image, int h, int w) {
    // Use shared memory to improve data access speed
    __shared__ int tile[3][64]; // Assuming blurSize^2 (8*8) max threads per block

    int threadId = threadIdx.y * blockDim.x + threadIdx.x;

    int Row = blockIdx.y * blockDim.y + threadIdx.y;
    int Col = blockIdx.x * blockDim.x + threadIdx.x;

    int blurSize = 8;

    Row = Row * blurSize;
    Col = Col * blurSize;

    int r, g, b;
    int p_r = 0;
    int p_g = 0;
    int p_b = 0;
    int i, j;

    if((Row + blurSize < h) && (Col + blurSize < w)) {

        // Load data into shared memory
        for(i = 0; i < blurSize; i++) {
            for(j = 0; j < blurSize; j++) {
                int currentIndex = 4 * w * (Row + j) + 4 * (Col + i);
                tile[0][threadId] = d_image[currentIndex + 0];
                tile[1][threadId] = d_image[currentIndex + 1];
                tile[2][threadId] = d_image[currentIndex + 2];
                __syncthreads();

                r = tile[0][threadId];
                g = tile[1][threadId];
                b = tile[2][threadId];

                p_r += r;
                p_g += g;
                p_b += b;
            }
        }

        p_r = p_r / (blurSize * blurSize);
        p_g = p_g / (blurSize * blurSize);
        p_b = p_b / (blurSize * blurSize);

        // Store result from shared memory back to global memory
        for(i = 0; i < blurSize; i++) {
            for(j = 0; j < blurSize; j++) {
                int currentIndex = 4 * w * (Row + j) + 4 * (Col + i);
                d_image[currentIndex + 0] = p_r;
                d_image[currentIndex + 1] = p_g;
                d_image[currentIndex + 2] = p_b;
            }
        }
    }
}