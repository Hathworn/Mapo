#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Subtract(float *d_Result, float *d_Data1, float *d_Data2, int width, int pitch, int height)
{
    // Calculate global thread coordinates
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Calculate linear index in the data arrays
    int p = y * pitch + x;

    // Boundary check to ensure threads operate within matrix dimensions
    if (x < width && y < height) {
        // Perform subtraction operation
        d_Result[p] = d_Data1[p] - d_Data2[p];
    }

    // Remove unnecessary __syncthreads
}