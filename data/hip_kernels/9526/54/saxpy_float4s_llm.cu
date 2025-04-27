#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void saxpy_float4s ( float* y, float* x, float a, clock_t * timer_vals)
{
    // Optimize by precalculating loop invariant values
    unsigned int base_idx = blockIdx.x * COMPUTE_THREADS_PER_CTA + threadIdx.x;
    unsigned int stride = COMPUTE_THREADS_PER_CTA * CTA_COUNT;

    float4 * x_as_float4 = (float4 *)x;
    float4 * y_as_float4 = (float4 *)y;

    for (int i=0; i < NUM_ITERS/4; i++) {      
        unsigned int idx = i * stride + base_idx;

        float4 tmp1_x = x_as_float4[idx];
        float4 tmp1_y = y_as_float4[idx];

        // Use float4 operations to reduce instructions
        y_as_float4[idx].x = a * tmp1_x.x + tmp1_y.x;
        y_as_float4[idx].y = a * tmp1_x.y + tmp1_y.y;
        y_as_float4[idx].z = a * tmp1_x.z + tmp1_y.z;
        y_as_float4[idx].w = a * tmp1_x.w + tmp1_y.w;
    }
}