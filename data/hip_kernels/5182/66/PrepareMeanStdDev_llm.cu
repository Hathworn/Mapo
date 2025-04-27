#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void PrepareMeanStdDev(float* input, float* delta, int imageWidth, int imageHeight)
{
    // Calculate the unique thread ID and size of the input
    int id = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;
    int size = imageWidth * imageHeight;

    // Ensure the thread is operating within the valid range
    if (id < size)
    {
        // Calculate pixel (x, y) positions
        int px = id % imageWidth;
        int py = id / imageWidth;

        // Precompute common expressions
        float normalizedX = 2.0f * px / imageWidth - 1;
        float normalizedY = 2.0f * py / imageHeight - 1;
        float inputVal = input[id];

        // Calculate mean sums
        delta[id] = inputVal * normalizedX;
        delta[id + size] = inputVal * normalizedY;

        // Calculate variance sums
        delta[id + 2 * size] = inputVal * normalizedX * normalizedX;
        delta[id + 3 * size] = inputVal * normalizedY * normalizedY;
    }
}