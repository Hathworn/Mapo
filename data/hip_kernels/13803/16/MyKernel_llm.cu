#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void MyKernel(float* devPtr, size_t pitch, int width, int height)
{
    // Calculate row using blockIdx.y and threadIdx.y
    int r = blockIdx.y * blockDim.y + threadIdx.y;
    if (r < height) 
    {
        float* row = (float*)((char*)devPtr + r * pitch);
        // Calculate column using blockIdx.x and threadIdx.x
        for (int c = blockIdx.x * blockDim.x + threadIdx.x; c < width; c += blockDim.x * gridDim.x) 
        {
            row[c] = 17.3;
        }
    }
}