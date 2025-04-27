#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_blur(unsigned char* Pout, unsigned char* Pin, int width, int height) {
    // Calculate thread's column and row within the image
    int col = threadIdx.x + blockIdx.x * blockDim.x;
    int row = threadIdx.y + blockIdx.y * blockDim.y;
    int k_size = 3;

    if (col < width && row < height) {
        int pixVal = 0;
        int pixels = 0;
        
        // Efficiently compute the boundary of the blur kernel
        int rowStart = max(0, row - k_size);
        int rowEnd = min(height - 1, row + k_size);
        int colStart = max(0, col - k_size);
        int colEnd = min(width - 1, col + k_size);
        
        for (int curRow = rowStart; curRow <= rowEnd; curRow++) {
            for (int curCol = colStart; curCol <= colEnd; curCol++) {
                pixVal += Pin[curRow * width + curCol];
                pixels++;
            }
        }
        
        // Calculate the result pixel value
        Pout[row * width + col] = (unsigned char)(pixVal / pixels);
    }
}