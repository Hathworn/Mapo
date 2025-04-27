#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void grayScale3(uchar3 *input, uchar3 *output, int width, int height) {
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;

    // Check within image bounds
    if (x < width && y < height) { 
        int tid = y * width + x;

        // Calculate grayscale value using integer arithmetic for performance
        unsigned char grayValue = (input[tid].x + input[tid].y + input[tid].z) / 3;

        // Assign grayscale value to all color channels
        output[tid] = make_uchar3(grayValue, grayValue, grayValue);
    }
}