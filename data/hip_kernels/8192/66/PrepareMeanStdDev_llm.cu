#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void PrepareMeanStdDev(float* input, float* delta, int imageWidth, int imageHeight)
{
    int id = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;
    int size = imageWidth * imageHeight;

    if (id < size)
    {
        float invWidth = 2.0f / imageWidth;
        float invHeight = 2.0f / imageHeight;
        
        // Calculate pixel positions
        int px = id % imageWidth;
        int py = id / imageWidth;
        float pixPosX = invWidth * px - 1.0f;
        float pixPosY = invHeight * py - 1.0f;
        
        // Load input data
        float inputVal = input[id];
        
        // Mean sum
        delta[id] = inputVal * pixPosX;       // x component
        delta[id + size] = inputVal * pixPosY; // y component
        
        // Variance sum
        delta[id + 2 * size] = inputVal * pixPosX * pixPosX; // x^2 component
        delta[id + 3 * size] = inputVal * pixPosY * pixPosY; // y^2 component
    }
}