#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
__global__ void invertVectorElements(float* vector, int n)
{
    // Use blockIdx and blockDim to handle larger vectors
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n)
    {
        // Avoid division by zero
        float val = vector[i];
        if (val != 0.0f)
        {
            vector[i] = 1.0f / val;
        }
    }
}