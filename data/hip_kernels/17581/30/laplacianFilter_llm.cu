#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void laplacianFilter(unsigned char *srcImage, unsigned char *dstImage, unsigned int width, unsigned int height)
{
    // Calculate 2D index from block and thread indices
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Define constant kernel to improve performance
    __constant__ float ker[3][3] = {{0, -1, 0}, {-1, 4, -1}, {0, -1, 0}};

    // Check if thread is within the bounds of the image
    if ((x >= 1) && (x < width - 1) && (y >= 1) && (y < height - 1))
    {
        // Use local register to store pixel sum
        float sum = 0;

        // Unroll loop for fixed kernel size for better performance
        for (int ky = -1; ky <= 1; ky++)
        {
            for (int kx = -1; kx <= 1; kx++)
            {
                float fl = srcImage[((y + ky) * width + (x + kx))];
                sum += fl * ker[ky + 1][kx + 1];
            }
        }
        // Store the result in the destination image
        dstImage[(y * width + x)] = sum;
    }
}