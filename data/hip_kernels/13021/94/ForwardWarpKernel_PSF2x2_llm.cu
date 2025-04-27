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

    // Compute the bottom-left corner of the target pixel
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;
    float px, py;
    float dx = modff (cx, &px);
    float dy = modff (cy, &py);
    int tx = (int)px;
    int ty = (int)py;
    float value = src[image_row_offset + j];

    // Common offset calculation
    int offset;
    float weight;

    // Bottom right corner
    offset = ty * image_stride + tx;
    if (tx >= 0 && tx < w && ty >= 0 && ty < h) {
        weight = dx * dy;
        _atomicAdd (dst + offset, value * weight);
        _atomicAdd (normalization_factor + offset, weight);
    }

    // Bottom left corner
    tx -= 1;
    offset = ty * image_stride + tx;
    if (tx >= 0 && tx < w && ty >= 0 && ty < h) {
        weight = (1.0f - dx) * dy;
        _atomicAdd (dst + offset, value * weight);
        _atomicAdd (normalization_factor + offset, weight);
    }

    // Upper left corner
    ty -= 1;
    offset = ty * image_stride + tx;
    if (tx >= 0 && tx < w && ty >= 0 && ty < h) {
        weight = (1.0f - dx) * (1.0f - dy);
        _atomicAdd (dst + offset, value * weight);
        _atomicAdd (normalization_factor + offset, weight);
    }

    // Upper right corner
    tx += 1;
    offset = ty * image_stride + tx;
    if (tx >= 0 && tx < w && ty >= 0 && ty < h) {
        weight = dx * (1.0f - dy);
        _atomicAdd (dst + offset, value * weight);
        _atomicAdd (normalization_factor + offset, weight);
    }
}