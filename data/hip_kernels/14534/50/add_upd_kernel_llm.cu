#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add_upd_kernel(float4 * __restrict__ output_buf, const float4 * __restrict__ input_buf1, const float4 * __restrict__ input_buf2, float alpha1, float alpha2, int elem_count)
{
    int elem_id = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Ensure we only process the elements within bounds
    if (elem_id < elem_count)
    {
        // Load inputs
        float4 val1 = __ldg(&input_buf1[elem_id]);
        float4 val2 = __ldg(&input_buf2[elem_id]);
        
        // Compute output value using fused multiply-add for potential optimization
        val1.x = fmaf(val1.x, alpha1, val2.x * alpha2);
        val1.y = fmaf(val1.y, alpha1, val2.y * alpha2);
        val1.z = fmaf(val1.z, alpha1, val2.z * alpha2);
        val1.w = fmaf(val1.w, alpha1, val2.w * alpha2);
        
        // Store result
        output_buf[elem_id] = val1;
    }
}