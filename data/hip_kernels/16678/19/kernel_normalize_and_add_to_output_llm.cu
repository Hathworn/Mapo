#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_normalize_and_add_to_output(float * dev_vol_in, float * dev_vol_out, float * dev_accumulate_weights, float * dev_accumulate_values)
{
    // Optimize index calculations using built-in functions
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int k = blockIdx.z * blockDim.z + threadIdx.z;

    // Boundary check to exit threads not processing valid data
    if (i >= c_volSize.x || j >= c_volSize.y || k >= c_volSize.z) return;

    // Calculate the index more efficiently
    long int out_idx = i + ((j + k * c_volSize.y) * c_volSize.x);

    float eps = 1e-6;

    // Use a single conditional for normalization check
    if (c_normalize && abs(dev_accumulate_weights[out_idx]) > eps) {
        dev_vol_out[out_idx] = dev_vol_in[out_idx] + (dev_accumulate_values[out_idx] / dev_accumulate_weights[out_idx]);
    } else {
        dev_vol_out[out_idx] = dev_vol_in[out_idx] + (c_normalize ? 0 : dev_accumulate_values[out_idx]);
    }
}