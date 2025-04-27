#include "hip/hip_runtime.h"
#include "includes.h"
#define CONSTANT_MEMORY_SIZE 100
__constant__ float constantMemoryData[CONSTANT_MEMORY_SIZE];

extern "C"
__global__ void constantMemoryKernel(float* array, int size)
{
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds
    if (index < size && index < CONSTANT_MEMORY_SIZE) {
        // Copy constant memory data to global memory
        array[index] = constantMemoryData[index];
    }
}