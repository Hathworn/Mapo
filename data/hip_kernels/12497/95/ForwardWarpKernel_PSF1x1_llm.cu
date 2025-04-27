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

    // Check for bounds
    if (i >= h || j >= w) return;

    int flow_row_offset = i * flow_stride + j;
    int image_row_offset = i * image_stride + j;

    // Load flow vectors
    float u_ = u[flow_row_offset];
    float v_ = v[flow_row_offset];

    //Compute target pixel
    float cx = fmaf(u_, time_scale, static_cast<float>(j) + 1.0f);
    float cy = fmaf(v_, time_scale, static_cast<float>(i) + 1.0f);

    // Convert float to integer
    int tx = __float2int_rn(cx);
    int ty = __float2int_rn(cy);

    // Load source value
    float value = src[image_row_offset];

    // Conditional atomic add
    if (tx >= 0 && tx < w && ty >= 0 && ty < h)
    {
        atomicAdd(dst + ty * image_stride + tx, value);
    }
}