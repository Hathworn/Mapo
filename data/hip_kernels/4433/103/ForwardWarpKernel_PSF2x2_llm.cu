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

    // Compute bottom left corner of a target pixel
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;

    // Decompose into integer pixel and fractions
    float px, py, dx = modff(cx, &px), dy = modff(cy, &py);
    int tx = (int)px, ty = (int)py;
    float value = src[image_row_offset + j];

    // Pre-calculate weight factors
    float weight_dx_dy = dx * dy;
    float weight_1dx_dy = (1.0f - dx) * dy;
    float weight_1dx_1dy = (1.0f - dx) * (1.0f - dy);
    float weight_dx_1dy = dx * (1.0f - dy);

    // Bottom right corner
    if (tx >= 0 && tx < w && ty >= 0 && ty < h)
    {
        _atomicAdd(dst + ty * image_stride + tx, value * weight_dx_dy);
        _atomicAdd(normalization_factor + ty * image_stride + tx, weight_dx_dy);
    }

    // Bottom left corner
    tx -= 1;
    if (tx >= 0 && tx < w && ty >= 0 && ty < h)
    {
        _atomicAdd(dst + ty * image_stride + tx, value * weight_1dx_dy);
        _atomicAdd(normalization_factor + ty * image_stride + tx, weight_1dx_dy);
    }

    // Upper left corner
    ty -= 1;
    if (tx >= 0 && tx < w && ty >= 0 && ty < h)
    {
        _atomicAdd(dst + ty * image_stride + tx, value * weight_1dx_1dy);
        _atomicAdd(normalization_factor + ty * image_stride + tx, weight_1dx_1dy);
    }

    // Upper right corner
    tx += 1;
    if (tx >= 0 && tx < w && ty >= 0 && ty < h)
    {
        _atomicAdd(dst + ty * image_stride + tx, value * weight_dx_1dy);
        _atomicAdd(normalization_factor + ty * image_stride + tx, weight_dx_1dy);
    }
}