#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SetValue(float* im, float val, int size) 
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified ID calculation
    if (id < size) 
    {
        im[id] = val; // Set value without branching
    }
}