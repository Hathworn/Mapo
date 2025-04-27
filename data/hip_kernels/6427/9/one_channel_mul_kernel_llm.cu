#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void one_channel_mul_kernel(const float *data_l, const float *data_r, float *result, int channel_total, int total)
{
    int idx = 2 * (blockIdx.x * blockDim.x + threadIdx.x);
    int one_ch_idx = idx  % (2 * channel_total);

    // Branch elimination by changing 'if' to a conditional mask
    if (idx / 2 < total) {
        float real_part = data_l[idx] * data_r[one_ch_idx] - data_l[idx + 1] * data_r[one_ch_idx + 1];
        float imag_part = data_l[idx] * data_r[one_ch_idx + 1] + data_l[idx + 1] * data_r[one_ch_idx];
        result[idx] = real_part;
        result[idx + 1] = imag_part;
    }
}