#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Subtract(float *d_Result, float *d_Data1, float *d_Data2, int width, int pitch, int height)
{
    // Calculate the global thread index for x and y dimensions
    const int x = blockIdx.x * SUBTRACT_W + threadIdx.x;
    const int y = blockIdx.y * SUBTRACT_H + threadIdx.y;
    
    // Calculate the linear index
    int p = y * pitch + x;
    
    // Check bounds and perform subtraction if within bounds
    if (x < width && y < height)
    {
        d_Result[p] = d_Data1[p] - d_Data2[p];
    }
    // Removed unnecessary __syncthreads() due to no shared memory usage
}