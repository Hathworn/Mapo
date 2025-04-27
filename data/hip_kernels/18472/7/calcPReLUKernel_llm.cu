#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calcPReLUKernel(const float *input, float *output, const float *weights, int width, int height, int channels)
{
    // Compute global thread index
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;

    // Calculate the linear index for input and output arrays
    int index = y * width + x;

    // Ensure the thread is within bounds
    if (x < width && y < height) {
        // Apply PReLU activation
        float inpVal = input[index];
        output[index] = inpVal > 0 ? inpVal : inpVal * weights[y % channels];
    }
}