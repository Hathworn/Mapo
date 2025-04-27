#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_normalize_and_add_to_output(float * dev_vol_in, float * dev_vol_out, float * dev_accumulate_weights, float * dev_accumulate_values)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int k = blockIdx.z * blockDim.z + threadIdx.z;

    if (i >= c_volSize.x || j >= c_volSize.y || k >= c_volSize.z) {
        return; // Early exit for out-of-bounds indices
    }

    long int out_idx = i + (j + k * c_volSize.y) * (c_volSize.x); // Row major indexing
    float eps = 1e-6;
    float acc_weight = dev_accumulate_weights[out_idx]; // Avoid repeated memory access

    if (c_normalize) {
        if (fabsf(acc_weight) > eps) { // Use fabsf to ensure single precision
            dev_vol_out[out_idx] = dev_vol_in[out_idx] + (dev_accumulate_values[out_idx] / acc_weight);
        } else {
            dev_vol_out[out_idx] = dev_vol_in[out_idx]; // Direct assignment without braces
        }
    } else {
        dev_vol_out[out_idx] = dev_vol_in[out_idx] + dev_accumulate_values[out_idx];
    }
}