#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_normalize_and_add_to_output(float *dev_vol_in, float *dev_vol_out, float *dev_accumulate_weights, float *dev_accumulate_values)
{
    // Calculate linear thread index based on a flattened 3D grid
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int k = blockIdx.z * blockDim.z + threadIdx.z;

    // Early exit for out-of-bounds threads in the grid
    if (i >= c_volSize.x || j >= c_volSize.y || k >= c_volSize.z)
    {
        return;
    }

    // Compute linear index in a row-major 3D structure
    long int out_idx = i + (j + k * c_volSize.y) * c_volSize.x;

    float eps = 1e-6;

    // Conditional normalization based on the flag and weight magnitude
    if (c_normalize)
    {
        float weight = dev_accumulate_weights[out_idx];
        if (abs(weight) > eps)
        {
            dev_vol_out[out_idx] = dev_vol_in[out_idx] + (dev_accumulate_values[out_idx] / weight);
        }
        else
        {
            dev_vol_out[out_idx] = dev_vol_in[out_idx];
        }
    }
    else
    {
        dev_vol_out[out_idx] = dev_vol_in[out_idx] + dev_accumulate_values[out_idx];
    }
}