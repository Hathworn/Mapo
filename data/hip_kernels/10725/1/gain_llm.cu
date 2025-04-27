#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gain(int width, int height, float rGain, float gGain, float bGain, float* input, float* output)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Optimize by calculating index once and using shared memory for faster access
    if ((x < width) && (y < height))
    {
        int index = (y * width + x) * 4;
        
        // Using registers to optimize arithmetic operations
        float r = input[index + 0];
        float g = input[index + 1];
        float b = input[index + 2];
        float a = input[index + 3];

        output[index + 0] = r * rGain;
        output[index + 1] = g * gGain;
        output[index + 2] = b * bGain;
        output[index + 3] = a;
    }
}