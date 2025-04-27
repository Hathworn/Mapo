#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void CompareVectorsKernel(float* inputOne, float* inputTwo, float* output)
{
    // Calculate 1D global index
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Use if condition for checking bounds
    if (id < gridDim.x * blockDim.x) {
        // Compare and write to output
        if (inputOne[id] != inputTwo[id]) {
            atomicExch(output, 1); // Use atomic operation to prevent race conditions
        }
    }
}