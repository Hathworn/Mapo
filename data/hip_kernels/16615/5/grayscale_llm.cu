#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void grayscale(unsigned char *data_rgb, unsigned char *data_gray, std::size_t rows, std::size_t cols)
{
    // Calculate global thread index for both dimensions
    auto i = blockIdx.x * blockDim.x + threadIdx.x;
    auto j = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds to ensure indices are within image dimensions
    if (i < cols && j < rows)
    {
        // Calculate single index to avoid redundant calculations
        std::size_t index = j * cols + i;
        // Apply formula to convert RGB to grayscale using predefined constants
        unsigned char gray_value = (
            307 * data_rgb[3 * index] +
            604 * data_rgb[3 * index + 1] +
            113 * data_rgb[3 * index + 2]
        ) / 1024;
        // Assign computed gray value to the output array
        data_gray[index] = gray_value;
    }
}