#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void absolute_kernel(float4* __restrict output, const float4* __restrict input, int elem_count)
{
    int elem_id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use grid stride loop for improved utilization
    for (int i = elem_id; i < elem_count; i += gridDim.x * blockDim.x)
    {
        float4 val = input[i];
        val.x = fabsf(val.x);
        val.y = fabsf(val.y);
        val.z = fabsf(val.z);
        val.w = fabsf(val.w);
        output[i] = val;
    }
}