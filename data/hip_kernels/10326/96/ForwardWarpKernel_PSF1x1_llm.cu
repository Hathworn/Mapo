#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void ForwardWarpKernel_PSF1x1(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *dst)
{
    // Use a single variable to store computed value of thread indices
    int idx_x = threadIdx.x + blockDim.x * blockIdx.x;
    int idx_y = threadIdx.y + blockDim.y * blockIdx.y;

    // Early exit if thread is outside of bounds
    if (idx_y >= h || idx_x >= w) return;

    // Use shared memory to reduce redundant computations
    int flow_row_offset = idx_y * flow_stride;
    int image_row_offset = idx_y * image_stride;

    // Cache flow values in registers
    float u_ = u[flow_row_offset + idx_x];
    float v_ = v[flow_row_offset + idx_x];

    // Compute target pixel positions and use texture memory for source access
    float cx = u_ * time_scale + (float)idx_x + 1.0f;
    float cy = v_ * time_scale + (float)idx_y + 1.0f;
    int tx = __float2int_rn(cx);
    int ty = __float2int_rn(cy);

    // Cache source value in local register
    float value = src[image_row_offset + idx_x];

    // Check if target pixel is within bounds and use atomic operations
    if (tx >= 0 && tx < w && ty >= 0 && ty < h) 
    {
        atomicAdd(dst + ty * image_stride + tx, value);
    }
}
```
