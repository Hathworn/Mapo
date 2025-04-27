#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cuda_kernel_texture_2d(unsigned char *surface, int width, int height, size_t pitch, float t) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure threads only process valid pixels
    if (x < width && y < height) {
        // Utilize shared memory for pixel computation if possible
        
        // Get pointer to pixel at (x, y)
        float *pixel = (float *)(surface + y * pitch) + 4 * x;

        // Calculate values for red and green components
        float normalized_x = (2.0f * x) / width - 1.0f;
        float normalized_y = (2.0f * y) / height - 1.0f;
        float value_x = 0.5f + 0.5f * cos(t + 10.0f * normalized_x);
        float value_y = 0.5f + 0.5f * cos(t + 10.0f * normalized_y);

        // Populate pixel value
        float pow_value_x = value_x * value_x * value_x;
        float pow_value_y = value_y * value_y * value_y;
        pixel[0] = 0.5f * pixel[0] + 0.5f * pow_value_x; // red
        pixel[1] = 0.5f * pixel[1] + 0.5f * pow_value_y; // green
        pixel[2] = 0.5f + 0.5f * cos(t); // blue
        pixel[3] = 1.0f; // alpha
    }
}