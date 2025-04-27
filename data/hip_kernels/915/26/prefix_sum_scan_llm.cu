#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void prefix_sum_scan(uint* dev_main_array, uint* dev_auxiliary_array, const uint array_size)
{
    // Calculate the global index
    uint element = blockIdx.x * blockDim.x + threadIdx.x;

    // Correct offset for processing the second block onwards
    element += blockDim.x;

    // Ensure within bounds
    if (element < array_size) {
        uint cluster_offset = dev_auxiliary_array[blockIdx.x + 1];
        dev_main_array[element] += cluster_offset;
    }
}