#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SetValue(float* im, float val, int size)
{
    // Use a single calculation for the thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x + 
             blockIdx.y * blockDim.x * gridDim.x;
    // Ensure in-bounds access
    if (id < size)
    {
        im[id] = val;
    }
}