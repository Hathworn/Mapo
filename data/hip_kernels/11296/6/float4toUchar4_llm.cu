#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void float4toUchar4(float4 *inputImage, uchar4 *outputImage, int width, int height) {
    // Calculate unique global thread index
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check boundaries
    if (x < width && y < height) {
        int offset = y * width + x;

        // Load and convert pixel values
        float4 pixelf = inputImage[offset];
        uchar4 pixel;
        pixel.x = (unsigned char) pixelf.x;
        pixel.y = (unsigned char) pixelf.y;
        pixel.z = (unsigned char) pixelf.z;
        pixel.w = (unsigned char) pixelf.w;

        // Store the converted pixel
        outputImage[offset] = pixel;
    }
}