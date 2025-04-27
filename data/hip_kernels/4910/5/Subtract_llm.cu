```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Subtract(float *d_Result, float *d_Data1, float *d_Data2, int width, int pitch, int height)
{
    const int x = blockIdx.x * blockDim.x + threadIdx.x;  // Use actual blockDim.x for better flexibility
    const int y = blockIdx.y * blockDim.y + threadIdx.y;  // Use actual blockDim.y for better flexibility
    int p = y * pitch + x;

    if (x < width && y < height) {
        d_Result[p] = d_Data1[p] - d_Data2[p];
    }
    // __syncthreads() is not necessary here as there is no inter-thread dependency
}