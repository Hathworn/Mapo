#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Subtract(float *d_Result, float *d_Data1, float *d_Data2, int width, int pitch, int height)
{
    // Calculate global thread index
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    int p = y * pitch + x;

    // Ensure within bounds before computation
    if (x < width && y < height) {
        // Perform subtraction without __syncthreads (not needed here)
        d_Result[p] = d_Data1[p] - d_Data2[p];
    }
}