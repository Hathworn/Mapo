#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_grayscale(int width, int height, float *image, float *image_out)
{
    // Calculate global thread indices for image processing
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure within the image bounds
    if (x < width && y < height) {
        int offset_out = (width * y) + x;
        int offset = offset_out * 3;

        // Perform grayscale conversion using efficient access and calculation
        float b = image[offset];
        float g = image[offset + 1];
        float r = image[offset + 2];
        
        // Store the computed grayscale value
        image_out[offset_out] = b * 0.0722f + g * 0.7152f + r * 0.2126f;
    }
}