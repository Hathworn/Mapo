#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ForwardWarpKernel_PSF1x1(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *dst)
{
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    if (i >= h || j >= w) return;

    // Calculate offsets and values more efficiently
    int offset = i * flow_stride + j;
    float u_ = u[offset];
    float v_ = v[offset];
    float value = src[i * image_stride + j];

    // Calculate target coordinates
    float cx = u_ * time_scale + (float)j + 1.0f;
    float cy = v_ * time_scale + (float)i + 1.0f;
    int tx = __float2int_rn(cx);
    int ty = __float2int_rn(cy);

    // Validate target coordinates and perform atomic add
    if (tx >= 0 && tx < w && ty >= 0 && ty < h)
    {
        atomicAdd(dst + ty * image_stride + tx, value);
    }
}