#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void rectified_linear_upd_kernel( const float4 * __restrict input, float4 * __restrict output, uint4 * __restrict bits_buffer, float negative_slope, int elem_count)
{
    int elem_id = blockDim.x * blockIdx.x + threadIdx.x;

    if (elem_id < elem_count)
    {
        float4 val = input[elem_id]; // Directly loading input into val
        uint4 bits;

        // Using __ballot_sync for both CUDA 9 and above for consistency
        bits.x = __ballot_sync(0xFFFFFFFF, val.x < 0.0F ? 0 : 1);
        bits.y = __ballot_sync(0xFFFFFFFF, val.y < 0.0F ? 0 : 1);
        bits.z = __ballot_sync(0xFFFFFFFF, val.z < 0.0F ? 0 : 1);
        bits.w = __ballot_sync(0xFFFFFFFF, val.w < 0.0F ? 0 : 1);

        int lane_id = elem_id & 31;
        if (lane_id == 0)
            bits_buffer[elem_id >> 5] = bits;

        // Inline negative slope application to reduce branching
        val.x = val.x < 0.0F ? val.x * negative_slope : val.x;
        val.y = val.y < 0.0F ? val.y * negative_slope : val.y;
        val.z = val.z < 0.0F ? val.z * negative_slope : val.z;
        val.w = val.w < 0.0F ? val.w * negative_slope : val.w;

        output[elem_id] = val;
    }
}