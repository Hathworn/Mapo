#include "hip/hip_runtime.h"
#include "includes.h"

typedef enum color {BLUE, GREEN, RED} Color;

// Optimized gray kernel function
__global__ void gray(unsigned char *src, unsigned char *dest, int width, int height, int step, int channels) {
    int ren = blockIdx.x;
    int col = threadIdx.x;
    
    // Check boundary conditions
    if (ren < height && col < width) {
        int pixel_index = (ren * step) + (col * channels);
        
        // Calculate gray value
        float r = (float) src[pixel_index + RED];
        float g = (float) src[pixel_index + GREEN];
        float b = (float) src[pixel_index + BLUE];
        unsigned char gray_value = (unsigned char) ((r + g + b) / 3);
        
        // Assign gray value to all color channels
        dest[pixel_index + RED] = gray_value;
        dest[pixel_index + GREEN] = gray_value;
        dest[pixel_index + BLUE] = gray_value;
    }
}