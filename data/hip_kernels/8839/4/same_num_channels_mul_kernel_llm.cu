#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void same_num_channels_mul_kernel(float *data_l, float *data_r, float *result)
{
    // Use linear thread indexing for better coalescing
    int threadId = 2 * (blockDim.x * blockDim.y * blockIdx.y * gridDim.x + blockDim.x * blockIdx.x + blockDim.x * threadIdx.y + threadIdx.x);

    // Reuse intermediate results to reduce redundant calculations
    float a = data_l[threadId];
    float b = data_l[threadId + 1];
    float c = data_r[threadId];
    float d = data_r[threadId + 1];

    result[threadId] = a * c - b * d;
    result[threadId + 1] = a * d + b * c;
}