#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void grayScale2(uchar3 *input, uchar3 *output, int width, int height) {

    // Calculate pixel indices
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if pixel is within bounds
    if (x < width && y < height) {
        int tid = y * width + x;

        // Compute grayscale value
        unsigned char gray = (input[tid].x + input[tid].y + input[tid].z) / 3;

        // Assign grayscale value
        output[tid].x = gray;
        output[tid].y = gray;
        output[tid].z = gray;
    }
}