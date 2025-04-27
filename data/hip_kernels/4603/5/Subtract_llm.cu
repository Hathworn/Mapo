#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Subtract(float *d_Result, float *d_Data1, float *d_Data2, int width, int pitch, int height)
{
    const int x = blockIdx.x * blockDim.x + threadIdx.x;  // Use blockDim for more flexibility
    const int y = blockIdx.y * blockDim.y + threadIdx.y;  // Use blockDim for more flexibility
    if (x < width && y < height) { // Check boundary before accessing memory
        int p = y * pitch + x;     // Calculate the index after boundary check
        d_Result[p] = d_Data1[p] - d_Data2[p];
    }
}