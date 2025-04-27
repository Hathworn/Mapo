#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Subtract(float *d_Result, float *d_Data1, float *d_Data2, int width, int pitch, int height)
{
    const int x = blockIdx.x * blockDim.x + threadIdx.x;  // Use blockDim instead of custom SUBTRACT_W
    const int y = blockIdx.y * blockDim.y + threadIdx.y;  // Use blockDim instead of custom SUBTRACT_H

    if (x < width && y < height) {  // Move index calculation inside the bounds check
        int p = y * pitch + x;
        d_Result[p] = d_Data1[p] - d_Data2[p];
    }
}