#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void same_num_channels_div_kernel(const float *data_l, const float *data_r, float *result, unsigned total)
{
    unsigned idx = 2 * (blockIdx.x * blockDim.x + threadIdx.x);

    // Check if the index is within bounds
    if (idx / 2 < total) {
        float real_l = data_l[idx];
        float imag_l = data_l[idx + 1];
        float real_r = data_r[idx];
        float imag_r = data_r[idx + 1];

        // Precalculate reused values
        float denom = real_r * real_r + imag_r * imag_r;
        float real = (real_l * real_r + imag_l * imag_r) / denom;
        float imag = (imag_l * real_r - real_l * imag_r) / denom;

        result[idx] = real;
        result[idx + 1] = imag;
    }
}