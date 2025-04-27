#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rectified_linear_backprop_upd_kernel( float4 * __restrict input_errors, const float4 * __restrict output_errors, const uint4 * __restrict bits_buffer, float negative_slope, bool add_update_to_destination, int elem_count)
{
    int elem_id = blockDim.x * blockIdx.x + threadIdx.x;
    if (elem_id < elem_count)
    {
        float4 val = output_errors[elem_id];
        uint4 bits = bits_buffer[elem_id >> 5];
        int lane_id = elem_id & 31;
        unsigned int mask = (1 << lane_id);

        // Apply negative slope using early exit to reduce branching
        if ((bits.x & mask) == 0) val.x *= negative_slope;
        if ((bits.y & mask) == 0) val.y *= negative_slope;
        if ((bits.z & mask) == 0) val.z *= negative_slope;
        if ((bits.w & mask) == 0) val.w *= negative_slope;
        
        // Use conditional addition with AddUpdate variable for readability
        float4 AddUpdate = add_update_to_destination ? input_errors[elem_id] : make_float4(0.0f, 0.0f, 0.0f, 0.0f);
        val.x += AddUpdate.x;
        val.y += AddUpdate.y;
        val.z += AddUpdate.z;
        val.w += AddUpdate.w;

        input_errors[elem_id] = val;
    }
}