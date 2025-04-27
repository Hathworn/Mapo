#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_image2D1C_ConvolveRow(float* img, int n_x, int n_y, short k, float *kernel, float* out)
{
    // Calculate linear index in x and y dimensions
    int idx_x = blockIdx.x * blockDim.x + threadIdx.x;
    int idx_y = blockIdx.y * blockDim.y + threadIdx.y;

    // Return early if indices are out of bounds
    if (idx_x >= n_x || idx_y >= n_y) return;

    float sum = 0;
    // Cache kernel half-width for re-use in loop condition
    short kernel_offset = k;
    
    for (short i = -kernel_offset; i <= kernel_offset; i++)
    {
        // Optimize boundary checks using max and min functions
        short x = max(0, min(n_x - 1, idx_x + i));
        
        // Accumulate convolution sum
        sum += kernel[i + kernel_offset] * img[idx_y * n_x + x];
    }
    
    // Store result to output array
    out[idx_y * n_x + idx_x] = sum;
}