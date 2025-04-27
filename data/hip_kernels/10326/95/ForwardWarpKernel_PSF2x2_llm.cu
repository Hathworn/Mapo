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

    int flow_row_offset = i * flow_stride;
    int image_row_offset = i * image_stride;

    // Calculate coordinates and integer parts efficiently
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;
    float px, py, dx = modff(cx, &px), dy = modff(cy, &py);
    int tx = (int)px, ty = (int)py;

    float value = src[image_row_offset + j];
    float weight;
    
    // Combine bounds check in a single branch
    if (tx < w && tx >= 0 && ty < h && ty >= 0)
    {
        weight = dx * dy;
        atomicAdd(dst + ty * image_stride + tx, value * weight);
        atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }

    // Pre-calculate common sub-expressions
    float dx_1 = 1.0f - dx;
    float dy_1 = 1.0f - dy;

    tx -= 1;
    if (tx < w && tx >= 0 && ty < h && ty >= 0)
    {
        weight = dx_1 * dy;
        atomicAdd(dst + ty * image_stride + tx, value * weight);
        atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }

    ty -= 1;
    if (tx < w && tx >= 0 && ty < h && ty >= 0)
    {
        weight = dx_1 * dy_1;
        atomicAdd(dst + ty * image_stride + tx, value * weight);
        atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }

    tx += 1;
    if (tx < w && tx >= 0 && ty < h && ty >= 0)
    {
        weight = dx * dy_1;
        atomicAdd(dst + ty * image_stride + tx, value * weight);
        atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }
}