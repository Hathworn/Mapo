#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void saxpy_float4s(float* y, float* x, float a, clock_t* timer_vals)
{
    int idx = (blockIdx.x * blockDim.x + threadIdx.x); // Compute global index based on block and thread index
    int stride = gridDim.x * blockDim.x; // Calculate total number of threads across the grid

    float4* x_as_float4 = (float4*)x;
    float4* y_as_float4 = (float4*)y;

    for (int i = idx; i < NUM_ITERS / 4; i += stride) {
        float4 tmp1_x = x_as_float4[i];
        float4 tmp1_y = y_as_float4[i];

        // Combine computation into a single float4 operation
        y_as_float4[i] = make_float4(
            a * tmp1_x.x + tmp1_y.x,
            a * tmp1_x.y + tmp1_y.y,
            a * tmp1_x.z + tmp1_y.z,
            a * tmp1_x.w + tmp1_y.w);
    }
}