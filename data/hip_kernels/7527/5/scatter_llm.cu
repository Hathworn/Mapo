#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scatter(int *d_array, int *d_scanArray, int *d_predicateArray, int *d_scatteredArray, int d_numberOfElements, int offset)
{
    // Calculate the global index for the current thread
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the index is within bounds
    if (index < d_numberOfElements)
    {
        int predicateValue = d_predicateArray[index];

        // Only scatter if predicateArray value is 1
        if (predicateValue == 1)
        {
            int scatterIndex = d_scanArray[index] - 1 + offset;

            // Place the value in the correct position in the scattered array
            d_scatteredArray[scatterIndex] = d_array[index];
        }
    }
}