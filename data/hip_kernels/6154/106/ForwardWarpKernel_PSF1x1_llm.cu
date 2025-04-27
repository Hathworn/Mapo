#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void ForwardWarpKernel_PSF1x1(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *dst)
{
    // Calculate global thread index in x and y directions
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    // Early exit for threads out of image bounds
    if (i >= h || j >= w) return;

    int flow_row_offset = i * flow_stride;
    int image_row_offset = i * image_stride;

    float u_ = u[flow_row_offset + j];
    float v_ = v[flow_row_offset + j];

    // Calculate bottom left corner position using time_scale
    float cx = fmaf(u_, time_scale, (float)j + 1.0f); // Using fmaf for fused-multiply-add
    float cy = fmaf(v_, time_scale, (float)i + 1.0f); // Using fmaf for fused-multiply-add

    // Convert bottom left corner position to nearest integer pixel index
    int tx = __float2int_rn(cx);
    int ty = __float2int_rn(cy);

    float value = src[image_row_offset + j];
    // Ensure the pixel falls within bounds before atomic addition
    if ((tx >= 0) && (tx < w) && (ty >= 0) && (ty < h))
    {
        // Using atomic add to avoid race conditions
        atomicAdd(dst + ty * image_stride + tx, value);
    }
}