#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void findAdjacencySizesKernel(int size, int *adjIndexes, int *output)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure thread operates within valid range
    if (idx >= size) return;
    output[idx] = adjIndexes[idx + 1] - adjIndexes[idx];
}