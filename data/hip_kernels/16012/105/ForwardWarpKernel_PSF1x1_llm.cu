#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void ForwardWarpKernel_PSF1x1(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *dst)
{
    int j = threadIdx.x + blockIdx.x * blockDim.x;
    int i = threadIdx.y + blockIdx.y * blockDim.y;

    // Ensure indices are within image boundaries
    if (i >= h || j >= w) return;

    int flow_idx = i * flow_stride + j;
    int image_idx = i * image_stride + j;

    // Pre-compute values
    float u_ = u[flow_idx];
    float v_ = v[flow_idx];

    float cx = u_ * time_scale + j + 1.0f;
    float cy = v_ * time_scale + i + 1.0f;

    int tx = __float2int_rn(cx);
    int ty = __float2int_rn(cy);

    // Validate target position before adding
    if (tx >= 0 && tx < w && ty >= 0 && ty < h) {
        float value = src[image_idx];
        atomicAdd(&dst[ty * image_stride + tx], value);
    }
}