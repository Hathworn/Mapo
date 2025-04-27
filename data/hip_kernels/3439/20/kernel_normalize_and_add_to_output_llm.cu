#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_normalize_and_add_to_output(float * dev_vol_in, float * dev_vol_out, float * dev_accumulate_weights, float * dev_accumulate_values)
{
    // Calculate indices using more efficient arithmetic
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int k = blockIdx.z * blockDim.z + threadIdx.z;

    if (i >= c_volSize.x || j >= c_volSize.y || k >= c_volSize.z)
    {
        return;
    }

    // Linearize index calculation for better performance
    long int out_idx = i + (j + k * c_volSize.y) * c_volSize.x;

    float eps = 1e-6;

    // Use direct index access and conditional operator for conciseness
    if (c_normalize)
    {
        dev_vol_out[out_idx] = abs(dev_accumulate_weights[out_idx]) > eps ? 
                               dev_vol_in[out_idx] + (dev_accumulate_values[out_idx] / dev_accumulate_weights[out_idx]) : 
                               dev_vol_in[out_idx];
    }
    else
    {
        dev_vol_out[out_idx] = dev_vol_in[out_idx] + dev_accumulate_values[out_idx];
    }
}