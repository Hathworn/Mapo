#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square(int *array, int arrayCount)
{
    // Calculate global thread index
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Check if within bounds and perform squaring
    if (idx < arrayCount) {
        array[idx] *= array[idx];
    }
}