#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void same_num_channels_mul_kernel(const float *data_l, const float *data_r, float *result, int total)
{
    int idx = 2 * (blockIdx.x * blockDim.x + threadIdx.x);

    // Optimize calculation by checking condition prior to computations
    if (idx < total * 2) {
        float left_real = data_l[idx];
        float left_imaginary = data_l[idx + 1];
        float right_real = data_r[idx];
        float right_imaginary = data_r[idx + 1];

        // Store results in registers before writing to global memory
        float res_real = left_real * right_real - left_imaginary * right_imaginary;
        float res_imaginary = left_real * right_imaginary + left_imaginary * right_real;

        result[idx] = res_real;
        result[idx + 1] = res_imaginary;
    }
}