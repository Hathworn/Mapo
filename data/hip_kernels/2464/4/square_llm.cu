#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void square(int *array, int arrayCount)
{
    // Calculate global thread ID
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Check if the global thread ID is within bounds
    if (idx < arrayCount) {
        int value = array[idx];
        array[idx] = value * value; // Perform squaring operation
    }
}