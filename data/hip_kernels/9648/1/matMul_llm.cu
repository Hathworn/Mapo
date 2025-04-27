#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matMul(unsigned char *image, unsigned char *resImage, int rows, int cols) {
    // Calculate unique thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize boundary check and loop unrolling
    int totalPixels = rows * cols;
    if (idx < totalPixels) {
        int pos = idx * chanDepth;
        unsigned char blue = image[pos + BLUE];
        unsigned char green = image[pos + GREEN];
        unsigned char red = image[pos + RED];

        // Apply one transformation and assign 
        resImage[pos + BLUE] = blue * 2;
        resImage[pos + GREEN] = green * 2;
        resImage[pos + RED] = red * 2;
    }
}