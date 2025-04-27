#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void absolute_upd_kernel(const float4* __restrict__ input, float4* __restrict__ output, int elem_count)
{
    // Calculate element index using faster multiplication with constants
    int elem_id = (blockIdx.y * gridDim.x + blockIdx.x) * blockDim.x + threadIdx.x;

    // Check bounds and perform computation if within element count
    if (elem_id < elem_count)
    {
        float4 val = input[elem_id];

        // Optimize absolute value computation
        val.x = fabsf(val.x);
        val.y = fabsf(val.y);
        val.z = fabsf(val.z);
        val.w = fabsf(val.w);

        output[elem_id] = val;
    }
}