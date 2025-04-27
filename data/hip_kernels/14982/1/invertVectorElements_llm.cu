#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
__global__ void invertVectorElements(float* vector, int n)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure threads operate within bounds
    if (i < n)
    {
        vector[i] = 1.0f / vector[i];
    }
}