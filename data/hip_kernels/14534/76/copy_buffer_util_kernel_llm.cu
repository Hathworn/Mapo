#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_buffer_util_kernel(const float4 * __restrict__ input_buf, float4 * __restrict__ output_buf, int elem_count)
{
    // Use shared memory when beneficial
    int elem_id = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Unroll loop if beneficial
    if (elem_id < elem_count)
    {
        output_buf[elem_id] = input_buf[elem_id];
    }
}