#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void ForwardWarpKernel_PSF1x1(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *dst)
{
    // Calculate global thread index
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    int i = blockIdx.y * blockDim.y + threadIdx.y;

    // Bounds check
    if (i >= h || j >= w) return;

    // Precompute row offsets
    int flow_row_offset = i * flow_stride;
    int image_row_offset = i * image_stride;

    // Load velocity components
    float u_ = __ldg(&u[flow_row_offset + j]);
    float v_ = __ldg(&v[flow_row_offset + j]);

    // Calculate corner of target pixel
    float cx = u_ * time_scale + static_cast<float>(j) + 1.0f;
    float cy = v_ * time_scale + static_cast<float>(i) + 1.0f;

    // Convert to integer target coordinates
    int tx = __float2int_rn(cx);
    int ty = __float2int_rn(cy);

    // Load source value and check bounds before atomic add
    float value = __ldg(&src[image_row_offset + j]);
    if (tx >= 0 && tx < w && ty >= 0 && ty < h)
    {
        // Atomic add to destination
        atomicAdd(dst + ty * image_stride + tx, value);
    }
}
```
