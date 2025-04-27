#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void windowBartlett2d(float* idata, int length, int height)
{
    // Calculate global 1D index for simplicity
    int global_index = threadIdx.y * blockDim.x + threadIdx.x + 
                       blockIdx.x * blockDim.x + blockIdx.y * blockDim.y * length;

    // Ensure index is within bounds of the matrix dimensions
    if (global_index < length * height)
    {
        idata[global_index] = 0;
    }
}