#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize memory access and reduce branching
__global__ void absolute_deriviative_upd_kernel( float4 * __restrict input_errors, const float4 * __restrict output_errors, const float4 * __restrict input_neurons, bool add_update_to_destination, int elem_count)
{
    int elem_id = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;
    if (elem_id < elem_count)
    {
        // Load data only once to optimize memory access
        float4 inp = input_neurons[elem_id];
        float4 current_error = output_errors[elem_id];
        
        // Use ternary operator to eliminate branching
        current_error.x = inp.x < 0.0f ? -current_error.x : current_error.x;
        current_error.y = inp.y < 0.0f ? -current_error.y : current_error.y;
        current_error.z = inp.z < 0.0f ? -current_error.z : current_error.z;
        current_error.w = inp.w < 0.0f ? -current_error.w : current_error.w;

        if (add_update_to_destination)
        {
            float4 current_dst = input_errors[elem_id];
            current_error.x += current_dst.x;
            current_error.y += current_dst.y;
            current_error.z += current_dst.z;
            current_error.w += current_dst.w;
        }
        
        // Write back the updated error
        input_errors[elem_id] = current_error;
    }
}