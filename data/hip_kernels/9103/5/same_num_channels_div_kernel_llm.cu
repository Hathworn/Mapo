#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void same_num_channels_div_kernel(const float *data_l, const float *data_r, float *result, unsigned total)
{
    unsigned idx = 2 * (blockIdx.x * blockDim.x + threadIdx.x);

    // Check if index is within bounds
    if (idx < 2 * total) {
        float real_l = data_l[idx];
        float imag_l = data_l[idx + 1];
        float real_r = data_r[idx];
        float imag_r = data_r[idx + 1];

        float denominator = real_r * real_r + imag_r * imag_r;

        // Calculation of real part
        result[idx] = (real_l * real_r + imag_l * imag_r) / denominator;

        // Calculation of imaginary part
        result[idx + 1] = (imag_l * real_r - real_l * imag_r) / denominator;
    }
}