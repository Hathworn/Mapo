#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void prefix_sum_scan(uint* dev_main_array, uint* dev_auxiliary_array, const uint array_size) {
    // Compute unique global index
    const uint element = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if within bounds and adjust index for second block onwards
    if (element < array_size) {
        const uint cluster_offset = dev_auxiliary_array[blockIdx.x]; // Use current block's offset
        dev_main_array[element + blockDim.x] += cluster_offset; // Adjust indexing by blockDim.x
    }
}