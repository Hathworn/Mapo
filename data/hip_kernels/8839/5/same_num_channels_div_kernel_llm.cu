#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void same_num_channels_div_kernel(float *data_l, float *data_r, float *result)
{
    int blockId = blockIdx.x + blockIdx.y * gridDim.x;
    int threadId = 2 * (blockId * (blockDim.x * blockDim.y) + (threadIdx.y * blockDim.x) + threadIdx.x);
   
    // Precompute repeated expressions to reduce redundant calculations
    float real_r1 = data_r[threadId];
    float real_r2 = data_r[threadId + 1];
    float denom = real_r1 * real_r1 + real_r2 * real_r2;

    // Ensure denominator is non-zero before division
    if (denom != 0) {
        result[threadId] = (data_l[threadId] * real_r1 + data_l[threadId + 1] * real_r2) / denom;
        result[threadId + 1] = (data_l[threadId + 1] * real_r1 - data_l[threadId] * real_r2) / denom;
    } else {
        result[threadId] = 0.0f;
        result[threadId + 1] = 0.0f;
    }
}