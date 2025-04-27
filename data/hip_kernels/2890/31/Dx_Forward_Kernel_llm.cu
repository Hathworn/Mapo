#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Dx_Forward_Kernel(float* output, const float* input, const int width, const int height, const int nChannels)
{
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;

    // Check if thread is within bounds
    if (x >= width || y >= height) return;

    int offset = y * width + x;
    int offsetChannels = offset * nChannels; // Pre-calculate for efficiency

    if (x == width - 1)
    {
        // Optimize assignment using memset
        for (int c = 0; c < nChannels; c++)
        {
            output[offsetChannels + c] = 0;
        }
    }
    else
    {
        for (int c = 0; c < nChannels; c++)
        {
            // Avoid recomputing offset
            output[offsetChannels + c] = input[(offset + 1) * nChannels + c] - input[offsetChannels + c];
        }
    }
}