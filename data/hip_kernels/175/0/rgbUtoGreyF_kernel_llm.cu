#include "hip/hip_runtime.h"
#include "includes.h"

#define XBLOCK 16
#define YBLOCK 16

__global__ void rgbUtoGreyF_kernel(int width, int height, unsigned int* rgbU, float* grey) {
    // Efficiently calculate global thread index
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    if (x < width && y < height) {
        int index = y * width + x;
        unsigned int rgb = rgbU[index];

        // Use constant values for RGB to greyscale conversion
        const float r_weight = 0.29894;
        const float g_weight = 0.58704;
        const float b_weight = 0.11402;
        
        // Use bitwise operations and multiplication to enhance readability and potentially optimize execution
        float r = (rgb & 0xFF) * (1.0 / 255.0);
        float g = ((rgb >> 8) & 0xFF) * (1.0 / 255.0);
        float b = ((rgb >> 16) & 0xFF) * (1.0 / 255.0);
        
        // Calculate greyscale value using pre-defined weights
        grey[index] = r_weight * r + g_weight * g + b_weight * b;
    }
}