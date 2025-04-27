#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void saxpy_float4s (float* y, float* x, float a, clock_t *timer_vals)
{
    // Using float4 pointers to handle four elements per thread improve memory operations.
    float4 * x_as_float4 = reinterpret_cast<float4 *>(x);
    float4 * y_as_float4 = reinterpret_cast<float4 *>(y);

    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int stride = blockDim.x * gridDim.x;

    // Loop unrolling for better performance
    for (int i = idx; i < NUM_ITERS/4; i += stride) {
        float4 tmp1_x = x_as_float4[i];
        float4 tmp1_y = y_as_float4[i];

        // Vectorized operation for performance
        float4 result_y;
        result_y.x = a * tmp1_x.x + tmp1_y.x;
        result_y.y = a * tmp1_x.y + tmp1_y.y;
        result_y.z = a * tmp1_x.z + tmp1_y.z;
        result_y.w = a * tmp1_x.w + tmp1_y.w;
        
        y_as_float4[i] = result_y;
    }
}