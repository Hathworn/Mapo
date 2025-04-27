#include "hip/hip_runtime.h"
#include "includes.h"

// Macro for fast integer multiplication
#define __iMul24(a, b) ((a) * (b))

// Optimized kernel function
__global__ void kernel_normalize_and_add_to_output(float * dev_vol_in, float * dev_vol_out, float * dev_accumulate_weights, float * dev_accumulate_values)
{
    // Use the recommended method for computing unique thread index
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int k = blockIdx.z * blockDim.z + threadIdx.z;

    // Early exit if indices are out of bounds
    if (i >= c_volSize.x || j >= c_volSize.y || k >= c_volSize.z) return;

    // Index row major into the volume
    long int out_idx = i + (j + k * c_volSize.y) * c_volSize.x;
    float eps = 1e-6f;

    // Efficient conditional operation for normalization
    float weight = dev_accumulate_weights[out_idx];
    float acc_value = dev_accumulate_values[out_idx];

    if (c_normalize)
    {
        if (fabsf(weight) > eps) // Use more efficient fabsf for float
        {
            dev_vol_out[out_idx] = dev_vol_in[out_idx] + (acc_value / weight);
        }
        else
        {
            dev_vol_out[out_idx] = dev_vol_in[out_idx];
        }
    }
    else
    {
        dev_vol_out[out_idx] = dev_vol_in[out_idx] + acc_value;
    }
}