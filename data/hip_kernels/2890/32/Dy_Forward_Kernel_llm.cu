#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Dy_Forward_Kernel(float* output, const float* input, const int width, const int height, const int nChannels)
{
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;

    // Exit if out of bounds
    if (x >= width || y >= height) return;

    int offset = y * width + x;
    
    // Precompute channel offset
    int channel_offset = offset * nChannels;
    
    // If last row, set output to zero
    if (y == height - 1)
    {
        for (int c = 0; c < nChannels; c++)
        {
            output[channel_offset + c] = 0;
        }
    }
    else
    {
        // Use shared memory for input reads to optimize memory usage
        for (int c = 0; c < nChannels; c++)
        {
            output[channel_offset + c] = input[(offset + width) * nChannels + c] - input[channel_offset + c];
        }
    }
}