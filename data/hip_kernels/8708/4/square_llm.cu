#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square(int *array, int arrayCount)
{
    // Improved: Load value into register for faster access and reduced memory traffic
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx < arrayCount) {
        int value = array[idx]; // Load once
        array[idx] = value * value; // Compute and store
    }
}