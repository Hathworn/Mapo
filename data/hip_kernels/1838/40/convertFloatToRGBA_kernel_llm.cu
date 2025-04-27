#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convertFloatToRGBA_kernel(uchar4 *out_image, const float *in_image, int width, int height) {
    // Calculate global thread indices for the x and y dimensions
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Ensure thread is within image bounds
    if (x < width && y < height) {
        int IND = y * width + x; 
        float val = in_image[IND]; 
        
        // Set RGBA values using the same float input
        out_image[IND] = make_uchar4(val, val, val, 255);
    }
}