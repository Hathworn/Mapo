#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void saxpy_float4s (float* y, float* x, float a, clock_t * timer_vals)
{
    // Calculate the start index for this thread
    unsigned int start_idx = (blockIdx.x * COMPUTE_THREADS_PER_CTA + threadIdx.x) * (NUM_ITERS / 4);
    float4 *x_as_float4 = (float4 *)x;
    float4 *y_as_float4 = (float4 *)y;

    // Loop unrolling to exploit more ILP
    for (int i = 0; i < (NUM_ITERS / 4); i += 4) {
        #pragma unroll 4
        for (int j = 0; j < 4; ++j) {
            unsigned int idx = start_idx + i + j;
            float4 tmp_x = x_as_float4[idx];
            float4 tmp_y = y_as_float4[idx];

            // Compute result using fused multiply-add for better performance
            tmp_y.x = fmaf(a, tmp_x.x, tmp_y.x);
            tmp_y.y = fmaf(a, tmp_x.y, tmp_y.y);
            tmp_y.z = fmaf(a, tmp_x.z, tmp_y.z);
            tmp_y.w = fmaf(a, tmp_x.w, tmp_y.w);

            y_as_float4[idx] = tmp_y;
        }
    }
}