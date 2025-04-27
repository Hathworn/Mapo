```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define MASK_WIDTH 3

__global__ void Convolution_2D_globalMemory(unsigned char* imgInput, unsigned char* imgOutput, const float* mask, int height, int width, int channels) {
    // Calculate the row and column indexes for the current pixel
    int rows = blockIdx.x * blockDim.x + threadIdx.x;
    int cols = blockIdx.y * blockDim.y + threadIdx.y;

    // Check boundaries
    if (rows < height && cols < width) {
        for (int c = 0; c < channels; c++) {
            float sum = 0;
            // Perform convolution operation
            for (int i = 0; i < MASK_WIDTH; i++) {
                int filterRow = rows - MASK_WIDTH / 2 + i;
                for (int j = 0; j < MASK_WIDTH; j++) {
                    int filterCol = cols - MASK_WIDTH / 2 + j;
                    if (filterRow >= 0 && filterRow < height && filterCol >= 0 && filterCol < width) {
                        sum += imgInput[(filterRow * width + filterCol) * channels + c] * mask[i * MASK_WIDTH + j];
                    }
                }
            }
            // Assign the result to the output image
            imgOutput[(rows * width + cols) * channels + c] = (unsigned char)sum;
        }
    }
}