#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel to calculate pixel color in parallel
__global__ void myFramebufferKernelOptimized(int width, int height, float *framebuffer)
{
    // Calculate the pixel indices
    int x = blockIdx.x * blockDim.x + threadIdx.x; // x-coordinate of pixel
    int y = blockIdx.y * blockDim.y + threadIdx.y; // y-coordinate of pixel

    // Ensure the thread corresponds to a valid pixel position
    if (x < width && y < height)
    {
        // Calculate linear pixel index
        int index = y * width + x;

        // Set color using some sample calculation, can be replaced with actual logic
        framebuffer[index * 3 + 0] = 0.5f; // Red component
        framebuffer[index * 3 + 1] = 0.5f; // Green component
        framebuffer[index * 3 + 2] = 0.5f; // Blue component
    }
}
