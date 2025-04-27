#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Subtract(float *d_Result, float *d_Data1, float *d_Data2, int width, int pitch, int height)
{
    // Compute the global thread coordinates
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Calculate the 1D index from 2D coordinates
    int p = y * pitch + x;

    // Boundary check
    if (x < width && y < height) {
        // Perform element-wise subtraction
        d_Result[p] = d_Data1[p] - d_Data2[p];
    }
}