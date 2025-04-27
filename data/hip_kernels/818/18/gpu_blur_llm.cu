#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_blur(unsigned char* Pout, unsigned char* Pin, int width, int height) {
    // Calculate row and column indices
    int col = threadIdx.x + blockIdx.x * blockDim.x;
    int row = threadIdx.y + blockIdx.y * blockDim.y;
    int k_size = 3;

    // Check bounds to ensure within image dimensions
    if (col < width && row < height) {
        int pixVal = 0;
        int pixels = 0;

        // Loop over kernel size applying bounds check logic directly
        for (int blurRow = max(0, row - k_size); blurRow <= min(row + k_size, height - 1); blurRow++) {
            for (int blurCol = max(0, col - k_size); blurCol <= min(col + k_size, width - 1); blurCol++) {
                pixVal += Pin[blurRow * width + blurCol];
                pixels++;
            }
        }

        // Calculate average pixel value
        Pout[row * width + col] = (unsigned char)(pixVal / pixels);
    }
}