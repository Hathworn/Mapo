#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void apply_weight_decay_util_kernel(
    const float4* __restrict__ learning_rates, 
    float4* __restrict__ weights, 
    float weight_decay, 
    int elem_count) 
{
    int elem_id = blockDim.x * blockIdx.x + threadIdx.x;
    
    if (elem_id < elem_count) 
    {
        // Load data from global memory only once
        float4 val = __ldg(&learning_rates[elem_id]);
        float4 current_weight = __ldg(&weights[elem_id]);

        // Calculate decay factor and update weights
        float decay_factor_x = 1.0F - val.x * weight_decay;
        float decay_factor_y = 1.0F - val.y * weight_decay;
        float decay_factor_z = 1.0F - val.z * weight_decay;
        float decay_factor_w = 1.0F - val.w * weight_decay;

        current_weight.x *= decay_factor_x;
        current_weight.y *= decay_factor_y;
        current_weight.z *= decay_factor_z;
        current_weight.w *= decay_factor_w;

        // Store the result back to global memory
        weights[elem_id] = current_weight;
    }
}