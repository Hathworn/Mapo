#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void same_num_channels_mul_kernel(const float *data_l, const float *data_r, float *result, int total)
{
    int idx = 2 * (blockIdx.x * blockDim.x + threadIdx.x);

    // Check if idx is valid within bounds
    if (idx < 2 * total) {
        float l0 = data_l[idx];
        float l1 = data_l[idx + 1];
        float r0 = data_r[idx];
        float r1 = data_r[idx + 1];

        // Perform complex number multiplication
        result[idx] = l0 * r0 - l1 * r1;
        result[idx + 1] = l0 * r1 + l1 * r0;
    }
}