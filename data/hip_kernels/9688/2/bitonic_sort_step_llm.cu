#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bitonic_sort_step(float *dev_values, int j, int k)
{
    unsigned int i = threadIdx.x + blockDim.x * blockIdx.x;
    unsigned int ixj = i ^ j;

    // Ensure threads with the required ids are doing sorting
    if (ixj > i) {
        bool ascending = (i & k) == 0;
        // Use a single conditional block to improve efficiency
        if ((ascending && dev_values[i] > dev_values[ixj]) || (!ascending && dev_values[i] < dev_values[ixj])) {
            // Swap elements
            float temp = dev_values[i];
            dev_values[i] = dev_values[ixj];
            dev_values[ixj] = temp;
        }
    }
}