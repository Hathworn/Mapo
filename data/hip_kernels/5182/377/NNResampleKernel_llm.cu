#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NNResampleKernel(float *input, float *output, int inputWidth, int inputHeight, int outputWidth, int outputHeight)
{
    // Calculate global thread index
    int id = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;
    
    // Precompute constants
    float xRatio = (float)(inputWidth - 1) / outputWidth;
    float yRatio = (float)(inputHeight - 1) / outputHeight;
    
    if (id < outputWidth * outputHeight)
    {
        // Compute 2D pixel location from 1D thread index
        int px = id % outputWidth;
        int py = id / outputWidth;
        
        // Compute nearest neighbor positions
        int x = (int)(xRatio * (px + 0.5f));
        int y = (int)(yRatio * (py + 0.5f));
        
        // Assign input pixel to output
        output[py * outputWidth + px] = input[y * inputWidth + x];
    }
}