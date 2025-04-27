#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 16
#define BLOCKSIZE_X 16
#define BLOCKSIZE_Y 16

// STD includes

// CUDA runtime

// Utilities and system includes

// Optimized Kernel Function
__global__ void averageKernel( unsigned char* inputChannel, unsigned char* outputChannel, int imageW, int imageH)
{
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int x = blockIdx.x * blockDim.x + threadIdx.x;

    if (y >= imageH || x >= imageW) return; // Check bounds early

    const unsigned int numElements = ((2 * KERNEL_RADIUS) + 1) * ((2 * KERNEL_RADIUS) + 1);
    unsigned int sum = 0;

    for (int kY = -KERNEL_RADIUS; kY <= KERNEL_RADIUS; kY++) {
        const int curY = y + kY;
        if (curY < 0 || curY >= imageH) continue; // Correct boundary check

        for (int kX = -KERNEL_RADIUS; kX <= KERNEL_RADIUS; kX++) {
            const int curX = x + kX;
            if (curX < 0 || curX >= imageW) continue; // Correct boundary check

            const int curPosition = (curY * imageW + curX);
            sum += inputChannel[curPosition]; // Sum up within boundaries
        }
    }

    outputChannel[y * imageW + x] = (unsigned char)(sum / numElements); // Write result
}