#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scatter(int *d_array, int *d_predicateArray, int *d_scanArray, int *d_compactedArray, int d_numberOfElements)
{
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within valid range
    if (index < d_numberOfElements)
    {
        // Check if the element should be compacted
        if (d_predicateArray[index] == 1)
        {
            // Pre-fetch the target index for compaction
            int targetIndex = d_scanArray[index] - 1;
            
            // Perform the scatter operation efficiently
            d_compactedArray[targetIndex] = d_array[index];
        }
    }
}