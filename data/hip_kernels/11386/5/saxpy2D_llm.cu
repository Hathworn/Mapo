#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void saxpy2D(float scalar, float * x, float * y, int NX, int NY)
{
    // Calculate the unique thread index in the flattened 2D grid
    int index = blockIdx.x * blockDim.x + threadIdx.x + (blockIdx.y * blockDim.y + threadIdx.y) * gridDim.x * blockDim.x;

    // Optimize by removing redundant calculations, perform SAXPY if index is within bounds
    if (index < NX * NY)
    {
        y[index] = scalar * x[index] + y[index];
    }
}