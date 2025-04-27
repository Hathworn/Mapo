#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Subtract(float *d_Result, float *d_Data1, float *d_Data2, int width, int pitch, int height)
{
    // Calculate global thread coordinates
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Linear index based on 2D grid coordinates
    int p = y * pitch + x;

    // Check boundaries
    if (x < width && y < height) {
        // Perform element-wise subtraction
        d_Result[p] = d_Data1[p] - d_Data2[p];
    }
}