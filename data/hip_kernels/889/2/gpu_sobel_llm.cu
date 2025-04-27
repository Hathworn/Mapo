#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_sobel(int width, int height, float *image, float *image_out)
{
    // Get the row and column from the block and thread indices
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if the thread is within image bounds
    if (x >= 1 && x < width - 1 && y >= 1 && y < height - 1)
    {
        // Compute Sobel operators
        float Gx = 
            -1 * image[(y - 1) * width + (x - 1)] + 
             1 * image[(y - 1) * width + (x + 1)] + 
            -2 * image[(y    ) * width + (x - 1)] + 
             2 * image[(y    ) * width + (x + 1)] + 
            -1 * image[(y + 1) * width + (x - 1)] + 
             1 * image[(y + 1) * width + (x + 1)];

        float Gy = 
            -1 * image[(y - 1) * width + (x - 1)] + 
            -2 * image[(y - 1) * width + (x    )] + 
            -1 * image[(y - 1) * width + (x + 1)] + 
             1 * image[(y + 1) * width + (x - 1)] + 
             2 * image[(y + 1) * width + (x    )] + 
             1 * image[(y + 1) * width + (x + 1)];

        // Calculate magnitude of gradient
        image_out[y * width + x] = sqrt(Gx * Gx + Gy * Gy);
    }
}