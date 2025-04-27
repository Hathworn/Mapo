#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_rows(float* input, float* output, const int nx, const int ny)
{
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    // Calculate the linear index for 1D grid traversal
    int index = ix + blockIdx.y * blockDim.y * nx + threadIdx.y * nx;

    if (ix < nx && index < nx * ny) // Single condition check
    {
        output[index] = input[index]; // Use linear index for both input and output
    }
}