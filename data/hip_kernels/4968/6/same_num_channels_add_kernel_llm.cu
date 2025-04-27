#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void same_num_channels_add_kernel(const float *data_l, const float *data_r, float *result, int total)
{
    // Calculate global thread ID
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize memory access by handling two elements per thread
    if (idx < total) {
        int address = 2 * idx;
        result[address] = data_l[address] + data_r[address];
        result[address + 1] = data_l[address + 1] + data_r[address + 1];
    }
}