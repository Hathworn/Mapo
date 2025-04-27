#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ExactResampleKernel_1toN(float *input, float *output, int inputWidth, int inputHeight, int outputWidth, int outputHeight)
{
    // Calculate the global thread index
    int id = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;
    int size = outputWidth * outputHeight;

    if (id < size)
    {
        // Output point coordinates
        int px = id % outputWidth;
        int py = id / outputWidth;

        // Precompute ratios outside the loop
        float xRatio = static_cast<float>(inputWidth) / outputWidth;
        float yRatio = static_cast<float>(inputHeight) / outputHeight;

        // Corresponding coordinates in the original image (using float operations)
        int x = static_cast<int>(px * xRatio);
        int y = static_cast<int>(py * yRatio);

        output[py * outputWidth + px] = input[y * inputWidth + x];
    }
}