#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void ForwardWarpKernel_PSF1x1(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *dst)
{
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    // Early exit if out of bounds
    if (i >= h || j >= w) return;

    // Precompute offsets
    int flow_row_offset = i * flow_stride;
    int image_row_offset = i * image_stride;

    // Fetch flow values
    float u_ = u[flow_row_offset + j];
    float v_ = v[flow_row_offset + j];

    // Calculate coordinates with pre-added offsets
    float cx = fmaf(u_, time_scale, j + 1.0f);
    float cy = fmaf(v_, time_scale, i + 1.0f);

    // Round to nearest integer pixel location
    int tx = __float2int_rn(cx);
    int ty = __float2int_rn(cy);

    // Fetch source value
    float value = src[image_row_offset + j];

    // Atomic add only within bounds
    if (tx >= 0 && tx < w && ty >= 0 && ty < h)
    {
        atomicAdd(&dst[ty * image_stride + tx], value);
    }
}