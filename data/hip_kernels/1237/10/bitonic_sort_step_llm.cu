#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bitonic_sort_step(float *dev_values, int j, int k)
{
    unsigned int i = threadIdx.x + blockDim.x * blockIdx.x;
    unsigned int ixj = i ^ j; // Calculate sorting partner

    // Only process valid pairs
    if (ixj > i)
    {
        bool ascending = (i & k) == 0; // Determine sort direction

        // Perform sorting based on direction
        if ((ascending && dev_values[i] > dev_values[ixj]) || (!ascending && dev_values[i] < dev_values[ixj]))
        {
            // Swap elements
            float temp = dev_values[i];
            dev_values[i] = dev_values[ixj];
            dev_values[ixj] = temp;
        }
    }
}