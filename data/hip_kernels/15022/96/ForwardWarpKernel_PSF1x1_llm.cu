#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

// Kernel with optimized access and operations
__global__ void ForwardWarpKernel_PSF1x1(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *dst)
{
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    if (i >= h || j >= w) return;

    int flow_idx = i * flow_stride + j;  // Compute the flow index once
    int image_idx = i * image_stride + j;  // Compute the image index once

    float u_ = u[flow_idx];
    float v_ = v[flow_idx];

    float cx = u_ * time_scale + (float)j + 1.0f;
    float cy = v_ * time_scale + (float)i + 1.0f;

    int tx = __float2int_rn(cx);
    int ty = __float2int_rn(cy);

    float value = src[image_idx];  // Load source value

    // Use atomicAdd for valid pixel contribution
    if (tx >= 0 && tx < w && ty >= 0 && ty < h)
    {
        _atomicAdd(dst + ty * image_stride + tx, value);
    }
}