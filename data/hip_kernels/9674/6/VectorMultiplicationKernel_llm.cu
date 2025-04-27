#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VectorMultiplicationKernel(int *array, int arrayCount)
{
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensures threads are not wasted by processing only valid indices
    for (int i = idx; i < arrayCount; i += blockDim.x * gridDim.x) {
        array[i] *= array[i];
    }
}