#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_normalize_and_add_to_output(float * __restrict__ dev_vol_in, float * __restrict__ dev_vol_out, float * __restrict__ dev_accumulate_weights, float * __restrict__ dev_accumulate_values)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index computation
    unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int k = blockIdx.z * blockDim.z + threadIdx.z;

    if (i < c_volSize.x && j < c_volSize.y && k < c_volSize.z) // Combined condition check
    {
        long int out_idx = i + (j + k * c_volSize.y) * c_volSize.x; // Row-major indexing

        float eps = 1e-6;

        float weight = dev_accumulate_weights[out_idx];
        float value_to_add = (abs(weight) > eps) ? (dev_accumulate_values[out_idx] / weight) : 0.0f; // Compute value to add conditionally

        dev_vol_out[out_idx] = dev_vol_in[out_idx] + (c_normalize ? value_to_add : dev_accumulate_values[out_idx]); // Simplified conditional addition
    }
}