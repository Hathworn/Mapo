#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sharpeningFilter(unsigned char* srcImage, unsigned char* dstImage, unsigned int width, unsigned int height, int channel)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    __shared__ float kernel[FILTER_WIDTH][FILTER_HEIGHT]; // Use shared memory for kernel
    if (threadIdx.x < FILTER_WIDTH && threadIdx.y < FILTER_HEIGHT) {
        kernel[threadIdx.y][threadIdx.x] = (threadIdx.y == 1 && threadIdx.x == 1) ? 9.0f : -1.0f; // Initialize kernel in shared memory
    }
    __syncthreads(); // Ensure kernel is loaded in shared memory

    // Check if thread is within bounds of the image
    if ((x >= FILTER_WIDTH / 2) && (x < (width - FILTER_WIDTH / 2)) && (y >= FILTER_HEIGHT / 2) && (y < (height - FILTER_HEIGHT / 2)))
    {
        for (int c = 0; c < channel; c++)
        {
            float sum = 0.0f;
            // Convolution using the kernel
            for (int ky = -FILTER_HEIGHT / 2; ky <= FILTER_HEIGHT / 2; ky++) {
                for (int kx = -FILTER_WIDTH / 2; kx <= FILTER_WIDTH / 2; kx++) {
                    float fl = srcImage[((y + ky) * width + (x + kx)) * channel + c];
                    sum += fl * kernel[ky + FILTER_HEIGHT / 2][kx + FILTER_WIDTH / 2];
                }
            }
            // Save computed pixel value
            dstImage[(y * width + x) * channel + c] = min(max(sum, 0.0f), 255.0f); // Clamp result to valid range
        }
    }
}