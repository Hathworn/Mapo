#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void replace_image_by_distance_kernel(const unsigned char *pImage, const float* pDepth, const unsigned char *pBackground, unsigned char *result, const float max_value, const unsigned int width, const unsigned int height, const unsigned int image_channels)
{
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Early exit for threads outside image bounds
    if (y >= height || x >= width)
        return;

    // Calculate indices once
    const int img_index = (y * width + x) * image_channels;
    const int result_index = (y * width + x) * 3;

    // Get depth and determine pixel replacement
    float z_distance = pDepth[y * width + x];
    if (isfinite(z_distance) && (z_distance > max_value))
    {
        result[result_index] = pBackground[result_index];
        result[result_index + 1] = pBackground[result_index + 1];
        result[result_index + 2] = pBackground[result_index + 2];
    }
    else
    {
        // Handle both gray and color images
        result[result_index] = pImage[img_index];
        result[result_index + 1] = (image_channels == 1) ? pImage[y * width + x] : pImage[img_index + 1];
        result[result_index + 2] = (image_channels == 1) ? pImage[y * width + x] : pImage[img_index + 2];
    }
}