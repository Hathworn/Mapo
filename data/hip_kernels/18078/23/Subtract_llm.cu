#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Subtract(float *d_Result, float *d_Data1, float *d_Data2, int width, int height)
{
    // Calculate coordinates using block size and thread index
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    // Calculate the linear index
    int p = y * width + x;
    
    // Only subtract if within bounds
    if (x < width && y < height) {
        d_Result[p] = d_Data1[p] - d_Data2[p];
    }
    
    // Synchronization not needed here, as there's no shared memory use
}