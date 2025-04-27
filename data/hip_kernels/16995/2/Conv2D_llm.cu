#include "hip/hip_runtime.h"
#include "includes.h"

#define MAX(a, b) ((a) > (b) ? (a) : (b))

#define GAUSSIAN_KERNEL_SIZE 3
#define SOBEL_KERNEL_SIZE 5
#define TILE_WIDTH 32
#define SMEM_SIZE 128

__global__ void Conv2D(float *d_image, float *kernel, float *d_result, int width, int height, int kernelSize) {
    const int sharedMemWidth = TILE_WIDTH + MAX(SOBEL_KERNEL_SIZE, GAUSSIAN_KERNEL_SIZE) - 1;
    __shared__ float sharedMem[sharedMemWidth][sharedMemWidth];

    const int tx = threadIdx.x;
    const int ty = threadIdx.y;

    // Calculate global and local indices
    int x = blockIdx.x * TILE_WIDTH + tx;
    int y = blockIdx.y * TILE_WIDTH + ty;
    
    // Load data into shared memory
    for (int by = 0; by <= 1; ++by) {
        for (int bx = 0; bx <= 1; ++bx) {
            int destX = tx + bx * TILE_WIDTH;
            int destY = ty + by * TILE_WIDTH;
            int srcX = x + bx * TILE_WIDTH - kernelSize / 2;
            int srcY = y + by * TILE_WIDTH - kernelSize / 2;
            
            // Boundary check for loading from global memory
            if (destY < sharedMemWidth && srcY >= 0 && srcY < height && srcX >= 0 && srcX < width) {
                sharedMem[destY][destX] = d_image[srcY * width + srcX];
            } else if (destY < sharedMemWidth) {
                sharedMem[destY][destX] = 0;
            }
        }
    }
   
    __syncthreads();

    // Perform convolution
    float accum = 0;
    for (int j = 0; j < kernelSize; j++) {
        for (int i = 0; i < kernelSize; i++) {
            accum += sharedMem[ty + j][tx + i] * kernel[j * kernelSize + i];
        }
    }

    // Write result to output
    if (x < width && y < height) {
        d_result[y * width + x] = fminf(fmaxf(accum, 0.0f), 1.0f);
    }

    __syncthreads();
}