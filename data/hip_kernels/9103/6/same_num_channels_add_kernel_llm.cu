#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void same_num_channels_add_kernel(const float *data_l, const float *data_r, float *result, int total)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int offset = 2 * idx;
    
    // Each thread processes 2 elements to improve coalesced memory access
    if (idx < total) {
        result[offset] = data_l[offset] + data_r[offset];
        result[offset + 1] = data_l[offset + 1] + data_r[offset + 1];
    }
}