#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CompareVectorsKernel(float* inputOne, float* inputTwo, float* output)
{
    int id = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x; // Optimized index calculation

    if (id < gridDim.x * blockDim.x * gridDim.y) { // Check bounds to prevent out-of-bounds access
        if (inputOne[id] != inputTwo[id]) {
            atomicExch(output, 1); // Use atomic operation for thread safety
        }
    }
}