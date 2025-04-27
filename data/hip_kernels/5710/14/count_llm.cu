#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void count(int *data, int input, int *result)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < gridDim.x * blockDim.x) // Ensure within bounds
    {
        if (data[i] == input)
        {
            atomicAdd(result, 1); // Direct atomicAdd without a temporary variable
        }
    }
}