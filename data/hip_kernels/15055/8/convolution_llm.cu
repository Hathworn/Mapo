#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convolution(uint8_t *inData, uint8_t *outData, int width, int height, float *kernel, int kwidth, int kheight, float ksum)
{
    // Calculate global x and y coordinates for thread
    int gx = blockIdx.x * blockDim.x + threadIdx.x;
    int gy = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Ensure the thread is within bounds
    if (gx < width && gy < height) {
        int rx = (kwidth - 1) / 2;
        int ry = (kheight - 1) / 2;

        float sum = 0.0f;
        
        // Traverse the kernel area
        for (int y = -ry; y <= ry; ++y) {
            int cy = max(0, min(height - 1, gy + y));
            for (int x = -rx; x <= rx; ++x) {
                int cx = max(0, min(width - 1, gx + x));
                sum += inData[cx + cy * width] * kernel[(x + rx) + (y + ry) * kwidth];
            }
        }

        // Clamp sum value to the valid range [0, 255] and divide by kernel sum
        outData[gx + gy * width] = (uint8_t) max(0.0f, min(255.0f, sum / ksum));
    }
}