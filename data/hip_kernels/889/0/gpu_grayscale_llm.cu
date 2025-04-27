#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_grayscale(int width, int height, float *image, float *image_out)
{
    // Calculate the linear index based on block and thread indices
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check that the index is within the bounds of the image
    if (idx < width * height) {
        // Each pixel has 3 floats for R, G, and B
        int pixel_start_idx = idx * 3;

        // Extract RGB values
        float r = image[pixel_start_idx];
        float g = image[pixel_start_idx + 1];
        float b = image[pixel_start_idx + 2];

        // Compute grayscale value using luminosity method
        image_out[idx] = 0.21f * r + 0.72f * g + 0.07f * b;
    }
}