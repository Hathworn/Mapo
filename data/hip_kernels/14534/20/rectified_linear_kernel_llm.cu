#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rectified_linear_kernel(float4* __restrict__ output, const float4* __restrict__ input, float negative_slope, int elem_count)
{
    int elem_id = blockDim.x * blockIdx.x + threadIdx.x;
    if (elem_id < elem_count)
    {
        // Load once to avoid redundant global memory access
        float4 val = input[elem_id];

        // Apply ReLU with negative slope using ternary operator for concise conditional check
        val.x = val.x < 0.0F ? val.x * negative_slope : val.x;
        val.y = val.y < 0.0F ? val.y * negative_slope : val.y;
        val.z = val.z < 0.0F ? val.z * negative_slope : val.z;
        val.w = val.w < 0.0F ? val.w * negative_slope : val.w;

        // Store result back to global memory
        output[elem_id] = val;
    }
}