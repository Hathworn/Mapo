#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_grey_and_thresh(unsigned char* Pout, unsigned char* Pin, int width, int height) {
    int col = threadIdx.x + blockIdx.x * blockDim.x;
    int row = threadIdx.y + blockIdx.y * blockDim.y;
    
    // Check if pixel within range
    if (col < width && row < height) {
        int gOffset = row * width + col;
        int rgbOffset = gOffset * 3;  // Channels are constant, simplified calculation.
        
        // Load values from global memory once, reuse values
        unsigned char r = Pin[rgbOffset];
        unsigned char g = Pin[rgbOffset + 1];
        unsigned char b = Pin[rgbOffset + 2];
        
        // Apply weighted sum to convert to grayscale
        unsigned char gval = __fmaf_rn(0.21f, r, __fmaf_rn(0.71f, g, 0.07f * b)); // Use fast multiply-add operations
        
        // Apply threshold and write to output
        Pout[gOffset] = gval > 157 ? 255 : 0;  // Inline threshold check for brevity
    }
}