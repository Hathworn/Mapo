#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void imgGray(unsigned char * d_image, unsigned char* d_imagegray, int width, int height) {

    // Calculate the row and column index
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure pixel indices are within the image boundaries
    if ((width > col) && (height > row)) {
        // Pre-calculate index for image and grayscale
        int imgIndex = (row * width + col) * 3;
        int grayIndex = row * width + col;

        // Compute grayscale value using weighted sum and store
        d_imagegray[grayIndex] = d_image[imgIndex + 2] * 0.299f +
                                 d_image[imgIndex + 1] * 0.587f +
                                 d_image[imgIndex] * 0.114f;
    }
}