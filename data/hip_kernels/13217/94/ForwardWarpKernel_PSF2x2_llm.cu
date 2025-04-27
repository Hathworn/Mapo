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

    // Early exit for threads outside image bounds
    if (i >= h || j >= w) return;

    int flow_row_offset = i * flow_stride;
    int image_row_offset = i * image_stride;

    // Compute the bottom-left corner of the target pixel
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;
    
    // Calculate fractional and integer parts
    float px, py, dx, dy;
    dx = modff(cx, &px);
    dy = modff(cy, &py);

    // Target pixel integer coordinates
    int tx = (int)px;
    int ty = (int)py;
    float value = src[image_row_offset + j];
    float weight;

    // Bottom-right corner
    if (tx < w && tx >= 0 && ty < h && ty >= 0)
    {
        weight = dx * dy;
        _atomicAdd(dst + ty * image_stride + tx, value * weight);
        _atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }

    // Bottom-left corner
    if (--tx >= 0)
    {
        if (tx < w && ty < h && ty >= 0)
        {
            weight = (1.0f - dx) * dy;
            _atomicAdd(dst + ty * image_stride + tx, value * weight);
            _atomicAdd(normalization_factor + ty * image_stride + tx, weight);
        }
    }

    // Top-left corner
    if (--ty >= 0)
    {
        if (tx < w && tx >= 0)
        {
            weight = (1.0f - dx) * (1.0f - dy);
            _atomicAdd(dst + ty * image_stride + tx, value * weight);
            _atomicAdd(normalization_factor + ty * image_stride + tx, weight);
        }
    }

    // Top-right corner
    if (++tx < w)
    {
        if (ty < h && ty >= 0)
        {
            weight = dx * (1.0f - dy);
            _atomicAdd(dst + ty * image_stride + tx, value * weight);
            _atomicAdd(normalization_factor + ty * image_stride + tx, weight);
        }
    }
}