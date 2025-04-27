#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void float2toUchar4(float2 *inputImage, uchar4 *outputImage, int width, int height, int index) {
    // Calculate global thread offset for a 2D grid efficiently using 1D index
    int offset = blockIdx.x * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;
    
    // Linear offset guard for safety
    if (offset < width * height) {
        float2 pixelf = inputImage[offset];
        float pixelfIndexed = (index == 0) ? pixelf.x : pixelf.y;
        unsigned char pixelVal = (unsigned char) abs(pixelfIndexed);
        
        // Avoid redundant calculations
        uchar4 pixel = make_uchar4(pixelVal, pixelVal, pixelVal, pixelVal);
        outputImage[offset] = pixel;
    }
}