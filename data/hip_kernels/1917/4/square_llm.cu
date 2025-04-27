#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square(int *array, int arrayCount)
{
    // Calculate unique thread index
    int idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Check if within bounds before operation
    if (idx < arrayCount) {
        int value = array[idx];
        array[idx] = value * value;
    }
}