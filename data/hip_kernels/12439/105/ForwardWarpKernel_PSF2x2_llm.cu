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

    // Calculate corner position
    float cx = u[flow_row_offset + j] * time_scale + static_cast<float>(j) + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + static_cast<float>(i) + 1.0f;

    // Break down the positions into integer and fractional parts
    float px, py, dx = modff(cx, &px), dy = modff(cy, &py);

    // Integer pixel coordinates
    int tx = static_cast<int>(px);
    int ty = static_cast<int>(py);

    float value = src[image_row_offset + j];
    float weight;

    // Bottom right
    if (tx >= 0 && tx < w && ty >= 0 && ty < h) {
        weight = dx * dy;
        atomicAdd(dst + ty * image_stride + tx, value * weight);
        atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }

    // Bottom left
    tx -= 1;
    if (tx >= 0 && tx < w && ty >= 0 && ty < h) {
        weight = (1.0f - dx) * dy;
        atomicAdd(dst + ty * image_stride + tx, value * weight);
        atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }

    // Upper left
    ty -= 1;
    if (tx >= 0 && tx < w && ty >= 0 && ty < h) {
        weight = (1.0f - dx) * (1.0f - dy);
        atomicAdd(dst + ty * image_stride + tx, value * weight);
        atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }

    // Upper right
    tx += 1;
    if (tx >= 0 && tx < w && ty >= 0 && ty < h) {
        weight = dx * (1.0f - dy);
        atomicAdd(dst + ty * image_stride + tx, value * weight);
        atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }
}