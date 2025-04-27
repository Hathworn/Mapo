#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void ForwardWarpKernel_PSF1x1(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *dst)
{
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    int i = blockIdx.y * blockDim.y + threadIdx.y;

    if (i >= h || j >= w) return;

    int flow_row_offset = i * flow_stride;
    int image_row_offset = i * image_stride;

    // Load shared variables
    float u_ = u[flow_row_offset + j];
    float v_ = v[flow_row_offset + j];

    // Calculate position
    float cx = u_ * time_scale + (float)j + 1.0f;
    float cy = v_ * time_scale + (float)i + 1.0f;

    // Convert to integer using round-to-nearest
    int tx = __float2int_rn(cx);
    int ty = __float2int_rn(cy);

    // Load source value
    float value = src[image_row_offset + j];

    // Perform bounds check before atomic add
    if (tx < w && tx >= 0 && ty < h && ty >= 0)
    {
        atomicAdd(dst + ty * image_stride + tx, value);
    }
}
```
