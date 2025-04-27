#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void imgGray(unsigned char *d_image, unsigned char *d_imagegray, int width, int height) {
    // Compute single index to improve readability and reuse
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    if ((width > col) && (height > row)) {
        int index = row * width + col;
        int rgbIndex = index * 3;
        // Use a float for coefficients to avoid additional casting
        d_imagegray[index] = d_image[rgbIndex + 2] * 0.299f 
                           + d_image[rgbIndex + 1] * 0.587f 
                           + d_image[rgbIndex] * 0.114f;
    }
}