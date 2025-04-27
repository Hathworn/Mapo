#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void ForwardWarpKernel_PSF2x2(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *normalization_factor, float *dst)
{
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    if (i >= h || j >= w) return;

    int flow_row_offset  = i * flow_stride;
    int image_row_offset = i * image_stride;

    // Use registers for frequently used variables
    float value = src[image_row_offset + j];
    
    // Precalculate corner positions and weights
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;
    float px, py, dx = modff(cx, &px), dy = modff(cy, &py);
    
    int tx = (int) px;
    int ty = (int) py;

    // Process each corner within limits
    if (tx < w && ty < h && tx >= 0 && ty >= 0) {
        float weight = dx * dy;
        _atomicAdd(dst + ty * image_stride + tx, value * weight);
        _atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }
    --tx;
    if (tx < w && ty < h && tx >= 0 && ty >= 0) {
        float weight = (1.0f - dx) * dy;
        _atomicAdd(dst + ty * image_stride + tx, value * weight);
        _atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }
    --ty;
    if (tx < w && ty < h && tx >= 0 && ty >= 0) {
        float weight = (1.0f - dx) * (1.0f - dy);
        _atomicAdd(dst + ty * image_stride + tx, value * weight);
        _atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }
    ++tx;
    if (tx < w && ty < h && tx >= 0 && ty >= 0) {
        float weight = dx * (1.0f - dy);
        _atomicAdd(dst + ty * image_stride + tx, value * weight);
        _atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }
}