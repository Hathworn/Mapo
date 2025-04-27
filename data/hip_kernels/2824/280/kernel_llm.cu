#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(float *g_data, float value)
{
    // Precompute block size and grid size for efficiency
    const int gridSize = blockDim.x * gridDim.x;

    // Stride loop allows handling larger arrays efficiently
    for (int idx = blockIdx.x * blockDim.x + threadIdx.x; idx < gridSize; idx += gridSize)
    {
        g_data[idx] += value;
    }
}