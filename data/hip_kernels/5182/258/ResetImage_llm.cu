#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ResetImage(float* im, int size)
{
    int id = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x; // Compute unique thread ID
    if (id < size)
    {
        im[id] = 0.0f; // Reset image value to 0.0f for better precision
    }
}