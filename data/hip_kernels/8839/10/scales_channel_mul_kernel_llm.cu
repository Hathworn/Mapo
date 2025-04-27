#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scales_channel_mul_kernel(float *data_l, float *data_r, float *result)
{
    // Calculate index based on block and thread ID, optimizing index calculation
    int globalThreadId = blockIdx.x * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;
    int threadId = 2 * globalThreadId;
    int one_ch_index = 2 * threadIdx.x;

    float left_real = data_l[threadId];
    float left_imag = data_l[threadId + 1];
    float right_real = data_r[one_ch_index];
    float right_imag = data_r[one_ch_index + 1];

    // Perform complex multiplication
    result[threadId] = left_real * right_real - left_imag * right_imag;
    result[threadId + 1] = left_real * right_imag + left_imag * right_real;
}