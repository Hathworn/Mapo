#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hillisSteeleScanDevice(int *d_array, int numberOfElements, int *d_tmpArray, int moveIndex)
{
    int index = threadIdx.x + blockDim.x * blockIdx.x;

    // Ensure index is within bounds
    if (index < numberOfElements && index >= moveIndex)
    {
        // Perform in-place update to improve memory access patterns
        d_tmpArray[index] += d_array[index - moveIndex];
    }
}