#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void same_num_channels_add_kernel(const float *data_l, const float *data_r, float *result, int total)
{
    // Calculate global thread index, optimize by using 1-based index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure array boundaries are respected
    if (idx < total) {
        int base = 2 * idx; // Compute base index for channel data
        result[base] = data_l[base] + data_r[base]; // Perform addition for channel 0
        result[base + 1] = data_l[base + 1] + data_r[base + 1]; // Perform addition for channel 1
    }
}