```c
#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void ForwardWarpKernel_PSF2x2(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *normalization_factor, float *dst)
{
    // Calculate 1D block index for better memory coalescing
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    int idy = blockDim.y * blockIdx.y + threadIdx.y;

    if (idx >= w || idy >= h) return;

    int flow_row_offset  = idy * flow_stride;
    int image_row_offset = idy * image_stride;

    // Bottom left corner of a target pixel
    float cx = u[flow_row_offset + idx] * time_scale + (float)idx + 1.0f;
    float cy = v[flow_row_offset + idx] * time_scale + (float)idy + 1.0f;

    // Calculate integer coords and sub-pixel offsets
    float px, py;
    float dx = modff(cx, &px);
    float dy = modff(cy, &py);

    int tx = (int)px;
    int ty = (int)py;
    float value = src[image_row_offset + idx];

    // Precompute and reuse common weights
    float w_dx_dy = dx * dy;
    float w_one_minus_dx_dy = (1.0f - dx) * dy;
    float w_dx_one_minus_dy = dx * (1.0f - dy);
    float w_one_minus_dx_one_minus_dy = (1.0f - dx) * (1.0f - dy);

    // Atomic adds to ensure race conditions are avoided
    if (tx < w && tx >= 0 && ty < h && ty >= 0)
    {
        atomicAdd(dst + ty * image_stride + tx, value * w_dx_dy);
        atomicAdd(normalization_factor + ty * image_stride + tx, w_dx_dy);
    }

    if (tx - 1 < w && tx - 1 >= 0 && ty < h && ty >= 0)
    {
        atomicAdd(dst + ty * image_stride + (tx - 1), value * w_one_minus_dx_dy);
        atomicAdd(normalization_factor + ty * image_stride + (tx - 1), w_one_minus_dx_dy);
    }

    if (tx - 1 < w && tx - 1 >= 0 && ty - 1 < h && ty - 1 >= 0)
    {
        atomicAdd(dst + (ty - 1) * image_stride + (tx - 1), value * w_one_minus_dx_one_minus_dy);
        atomicAdd(normalization_factor + (ty - 1) * image_stride + (tx - 1), w_one_minus_dx_one_minus_dy);
    }

    if (tx < w && tx >= 0 && ty - 1 < h && ty - 1 >= 0)
    {
        atomicAdd(dst + (ty - 1) * image_stride + tx, value * w_dx_one_minus_dy);
        atomicAdd(normalization_factor + (ty - 1) * image_stride + tx, w_dx_one_minus_dy);
    }
}
```
