#include "hip/hip_runtime.h"
#include "includes.h"

// GPU constant memory to hold our kernels (extremely fast access time)
__constant__ float convolutionKernelStore[256];

/**
* Convolution function for cuda. Destination is expected to have the same width/height as source, but there will be a border
* of floor(kWidth/2) pixels left and right and floor(kHeight/2) pixels top and bottom
*
* @param source      Source image host pinned memory pointer
* @param width       Source image width
* @param height      Source image height
* @param paddingX    source image padding along x
* @param paddingY    source image padding along y
* @param kOffset     offset into kernel store constant memory
* @param kWidth      kernel width
* @param kHeight     kernel height
* @param destination Destination image host pinned memory pointer
*/

__global__ void convolve(unsigned char *source, int width, int height, int paddingX, int paddingY, ssize_t kOffset, int kWidth, int kHeight, unsigned char *destination)
{
    // Calculate our pixel's location
    int x = (blockIdx.x * blockDim.x) + threadIdx.x;
    int y = (blockIdx.y * blockDim.y) + threadIdx.y;

    // Shared memory for tiles, loads a block of source image into shared memory
    extern __shared__ float shared_source[];
    
    int pWidth = kWidth / 2;
    int pHeight = kHeight / 2;
    
    // Load data into shared memory
    int shared_x = threadIdx.x + pWidth;
    int shared_y = threadIdx.y + pHeight;

    if (x < width && y < height)
    {
        shared_source[shared_y * (blockDim.x + kWidth) + shared_x] = float(source[y * width + x]);
    }

    // Load halo data into shared memory
    if (threadIdx.x < pWidth && x >= pWidth)
    {
        shared_source[shared_y * (blockDim.x + kWidth) + threadIdx.x] = float(source[y * width + x - pWidth]);
    }

    if (threadIdx.x >= blockDim.x - pWidth && x < width - pWidth)
    {
        shared_source[shared_y * (blockDim.x + kWidth) + threadIdx.x + 2 * pWidth] = float(source[y * width + x + pWidth]);
    }

    if (threadIdx.y < pHeight && y >= pHeight)
    {
        shared_source[threadIdx.y * (blockDim.x + kWidth) + shared_x] = float(source[(y - pHeight) * width + x]);
    }

    if (threadIdx.y >= blockDim.y - pHeight && y < height - pHeight)
    {
        shared_source[(threadIdx.y + 2 * pHeight) * (blockDim.x + kWidth) + shared_x] = float(source[(y + pHeight) * width + x]);
    }

    __syncthreads();

    float sum = 0.0;

    // Only execute for valid pixels
    if (x >= pWidth + paddingX &&
        y >= pHeight + paddingY &&
        x < (blockDim.x * gridDim.x) - pWidth - paddingX &&
        y < (blockDim.y * gridDim.y) - pHeight - paddingY)
    {
        for (int j = -pHeight; j <= pHeight; j++)
        {
            for (int i = -pWidth; i <= pWidth; i++)
            {
                // Sample the weight for this location
                int ki = (i + pWidth);
                int kj = (j + pHeight);
                float w = convolutionKernelStore[(kj * kWidth) + ki + kOffset];

                sum += w * shared_source[(shared_y + j) * (blockDim.x + kWidth) + (shared_x + i)];
            }
        }
    }

    // Write result
    if (x < width && y < height) 
    {
        destination[(y * width) + x] = (unsigned char)sum;
    }
}