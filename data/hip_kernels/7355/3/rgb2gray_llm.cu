#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void rgb2gray (float * input, float *output, int height, int width)
{
    // Calculate global index for current thread
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Check if thread is within image bounds
    if(x < height && y < width)
    {
        // Reduce redundant calculations by precomputing index
        unsigned int idx3 = (x * width + y) * 3;
        unsigned int idx = x * width + y;
        
        // Load color values
        float r = input[idx3];
        float g = input[idx3 + 1];
        float b = input[idx3 + 2];
        
        // Convert to grayscale using weighted sum
        output[idx] = (0.21f * r + 0.71f * g + 0.07f * b);
    }
}