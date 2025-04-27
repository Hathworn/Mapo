#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_with_value_util_kernel(float4 * __restrict buf, float v, int elem_count)
{
    int elem_id = blockDim.x * blockIdx.x + threadIdx.x;
    if (elem_id < elem_count)
    {
        // Precompute the same value to avoid repeated operations
        float4 val = make_float4(v, v, v, v);
        buf[elem_id] = val;
    }
}