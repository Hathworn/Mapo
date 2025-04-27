#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void color_to_grey(uchar3 *input_image, uchar3 *output_image, int width, int height)
{
    int col = threadIdx.x + blockIdx.x * blockDim.x;
    int row = threadIdx.y + blockIdx.y * blockDim.y;

    if (col < width && row < height)
    {
        int pos = row * width + col;
        // Calculate the grayscale value once and use it for all three channels
        unsigned char grey_value = static_cast<unsigned char>(input_image[pos].x * 0.2126f + input_image[pos].y * 0.7125f + input_image[pos].z * 0.0722f);
        output_image[pos] = make_uchar3(grey_value, grey_value, grey_value); // Use make_uchar3 for cleaner assignment
    }
}