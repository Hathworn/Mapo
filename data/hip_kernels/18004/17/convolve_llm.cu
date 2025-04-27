#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convolve(unsigned char* imgInput, int width, int height, int paddingX, int paddingY, int kWidth, int kHeight, unsigned int offset, unsigned char* imgOutput)
{
    // Calculate our pixel's location
    int x = (blockIdx.x * blockDim.x) + threadIdx.x;
    int y = (blockIdx.y * blockDim.y) + threadIdx.y;

    if (x >= paddingX && y >= paddingY && x < width - paddingX && y < height - paddingY) // Validate pixel is within bounds
    {
        float sum = 0.0;
        int pWidth = kWidth / 2;
        int pHeight = kHeight / 2;

        // Iterate over the kernel
        for (int j = -pHeight; j <= pHeight; j++)
        {
            for (int i = -pWidth; i <= pWidth; i++)
            {
                // Calculate mask index and ensure bounds are valid
                int ki = i + pWidth;
                int kj = j + pHeight;
                float w = mask[offset + kj * kWidth + ki];

                // Accumulate weighted pixel value
                sum += w * float(imgInput[(y + j) * width + (x + i)]);
            }
        }
        imgOutput[y * width + x] = (unsigned char)sum;
    }
}