#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NNResampleKernel(float *input, float *output, int inputWidth, int inputHeight, int outputWidth, int outputHeight)
{
    // Calculate pixel index
    int id = blockDim.x * blockIdx.x + threadIdx.x;
    int size = outputWidth * outputHeight;

    // Ensure we are within bounds
    if (id < size)
    {
        int px = id % outputWidth;
        int py = id / outputWidth;

        // Precompute ratios for efficiency
        float xRatio = (float)(inputWidth - 1) / outputWidth;
        float yRatio = (float)(inputHeight - 1) / outputHeight;

        // Calculate nearest neighbor indices
        int x = (int)(xRatio * px + 0.5f);
        int y = (int)(yRatio * py + 0.5f);

        // Remap the pixel
        output[id] = input[y * inputWidth + x];
    }
}