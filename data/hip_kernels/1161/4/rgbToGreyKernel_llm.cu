#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rgbToGreyKernel(int height, int width, unsigned char *input_img, unsigned char *output_img)
{
    // Combine row and col computation into a single index
    int idx = blockIdx.y * blockDim.y * width + blockIdx.x * blockDim.x + threadIdx.y * width + threadIdx.x;
    
    if (idx < height * width)
    {
        // Reduce repeated index calculations
        int colorIdx = 3 * idx;
        float red = (float)input_img[colorIdx];
        float green = (float)input_img[colorIdx + 1];
        float blue = (float)input_img[colorIdx + 2];

        output_img[idx] = 0.21f * red + 0.71f * green + 0.07f * blue;
    }
}