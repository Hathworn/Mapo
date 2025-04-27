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

    if (i >= h || j >= w) return;

    int flow_index = i * flow_stride + j;
    int image_index = i * image_stride + j;

    float u_ = u[flow_index];
    float v_ = v[flow_index];

    // Calculate target coordinates
    float cx = u_ * time_scale + static_cast<float>(j) + 1.0f;
    float cy = v_ * time_scale + static_cast<float>(i) + 1.0f;

    int tx = __float2int_rn(cx); // Target x-coordinate
    int ty = __float2int_rn(cy); // Target y-coordinate

    float value = src[image_index]; // Source pixel value

    // Use atomic add only if target is within bounds
    if (tx >= 0 && tx < w && ty >= 0 && ty < h)
    {
        _atomicAdd(dst + ty * image_stride + tx, value);
    }
}