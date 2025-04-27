#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ExactResampleKernel_1toN(float *input, float *output, int inputWidth, int inputHeight, int outputWidth, int outputHeight)
{
    // Calculate linear index based on block and thread indices
    int id = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;
    int size = outputWidth * outputHeight;

    if (id < size)
    {
        // Calculate output point coordinates
        int px = id % outputWidth;
        int py = id / outputWidth;

        // Precompute ratios
        float xRatio = static_cast<float>(inputWidth) / outputWidth;
        float yRatio = static_cast<float>(inputHeight) / outputHeight;

        // Compute corresponding coordinates in the original image
        int x = min(static_cast<int>(px * xRatio), inputWidth - 1); // Ensure within bounds
        int y = min(static_cast<int>(py * yRatio), inputHeight - 1); // Ensure within bounds

        output[py * outputWidth + px] = input[y * inputWidth + x];
    }
}