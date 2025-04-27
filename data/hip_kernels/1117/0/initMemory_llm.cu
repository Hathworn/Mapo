#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initMemory(size_t position, size_t* array)
{
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Calculate the global index once
    size_t globalIdx = position + idx;

    // Use global index to access memory
    array[globalIdx] = idx;
}