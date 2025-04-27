#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function using 2D grid and block index calculations
__global__ void Multiply(float* im, float val, int size)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x + (blockIdx.y * gridDim.x * blockDim.x);
    if (id < size)
    {
        im[id] *= val;
    }
}