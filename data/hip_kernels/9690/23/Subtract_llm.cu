#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Subtract(float *d_Result, float *d_Data1, float *d_Data2, int width, int height)
{
    // Use blockDim and blockIdx for cleaner indexing
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    int p = y * width + x;
    
    if (x < width && y < height) {
        d_Result[p] = d_Data1[p] - d_Data2[p];
    }
}