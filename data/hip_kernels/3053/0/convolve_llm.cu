#include "hip/hip_runtime.h"
#include "includes.h"

// GPU constant memory to hold our kernels (extremely fast access time)
__constant__ float convolutionKernelStore[256];

// Kernel function optimized for shared memory usage and memory access patterns
__global__ void convolve(unsigned char *source, int width, int height, int paddingX, int paddingY, size_t kOffset, int kWidth, int kHeight, unsigned char *destination)
{
    // Calculate pixel position
    int x = (blockIdx.x * blockDim.x) + threadIdx.x;
    int y = (blockIdx.y * blockDim.y) + threadIdx.y;

    // Use shared memory for storing kernel values
    __shared__ float shKernel[256]; // Adjust the size according to maximum kernel size
    if (threadIdx.x < kWidth && threadIdx.y < kHeight) {
        int kIndex = threadIdx.y * kWidth + threadIdx.x;
        shKernel[kIndex] = convolutionKernelStore[kIndex + kOffset];
    }
    __syncthreads();

    float sum = 0.0f;
    int pWidth = kWidth / 2;
    int pHeight = kHeight / 2;

    // Process only valid pixels
    if (x >= pWidth + paddingX &&
        y >= pHeight + paddingY &&
        x < (blockDim.x * gridDim.x) - pWidth - paddingX &&
        y < (blockDim.y * gridDim.y) - pHeight - paddingY)
    {
        for (int j = -pHeight; j <= pHeight; ++j)
        {
            for (int i = -pWidth; i <= pWidth; ++i)
            {
                int ki = (i + pWidth);
                int kj = (j + pHeight);
                // Access shared memory for kernel weights
                float w = shKernel[(kj * kWidth) + ki];
                sum += w * float(source[((y + j) * width) + (x + i)]);
            }
        }
    }
    // Average the sum and store in destination
    destination[(y * width) + x] = (unsigned char)sum;
}