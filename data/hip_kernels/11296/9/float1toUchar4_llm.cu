#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void float1toUchar4(float1 *inputImage, uchar4 *outputImage, int width, int height) {
    // Calculate the global thread offset
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure within image boundaries
    if (x < width && y < height) {
        int offset = y * width + x;
        float1 pixelf = inputImage[offset];
        unsigned char value = static_cast<unsigned char>(pixelf.x);

        // Create uchar4 pixel
        uchar4 pixel;
        pixel.x = value;
        pixel.y = value;
        pixel.z = value;
        pixel.w = value;

        // Assign to output
        outputImage[offset] = pixel;
    }
}