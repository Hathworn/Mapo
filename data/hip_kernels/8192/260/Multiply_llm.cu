#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Multiply(float* im, float val, int size)
{
    // Calculate a unique global index for each thread
    int id = threadIdx.x + blockIdx.x * blockDim.x + blockIdx.y * blockDim.x * gridDim.x;

    // Perform computation only if id is within bounds
    if (id < size)
    {
        // Multiply image value by the given scalar
        im[id] *= val;
    }
}