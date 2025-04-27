#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void apply_gradient_with_weight_decay_util_kernel(const float2 * __restrict__ gradient, const float2 * __restrict__ learning_rates, float2 * __restrict__ weights, float weight_decay, int elem_count)
{
    // Calculate unique thread index
    int elem_id = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Ensure thread is within bounds
    if (elem_id < elem_count)
    {
        // Load data from global memory to registers
        float2 lr = learning_rates[elem_id];
        float2 current_weight = weights[elem_id];
        float2 grad = gradient[elem_id];

        // Perform computation on registers
        weights[elem_id].x = current_weight.x + lr.x * (grad.x - weight_decay * current_weight.x);
        weights[elem_id].y = current_weight.y + lr.y * (grad.y - weight_decay * current_weight.y);
    }
}