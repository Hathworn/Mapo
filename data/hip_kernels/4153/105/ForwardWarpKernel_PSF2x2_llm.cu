#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val) {
    return val.y;
}

__global__ void ForwardWarpKernel_PSF2x2(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *normalization_factor, float *dst) {
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    if (i >= h || j >= w) return;

    int flow_row_offset  = i * flow_stride;
    int image_row_offset = i * image_stride;

    // Move common calculations out of conditional blocks
    float cx = u[flow_row_offset + j] * time_scale + static_cast<float>(j) + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + static_cast<float>(i) + 1.0f;
    float px, py;
    float dx = modff(cx, &px);
    float dy = modff(cy, &py);
    float value = src[image_row_offset + j];

    // Precompute weights
    float w_br = dx * dy;
    float w_bl = (1.0f - dx) * dy;
    float w_ul = (1.0f - dx) * (1.0f - dy);
    float w_ur = dx * (1.0f - dy);

    // Consolidate boundary checks to improve efficiency
    int tx = static_cast<int>(px);
    int ty = static_cast<int>(py);

    if (tx >= 0 && tx < w && ty >= 0 && ty < h) {
        _atomicAdd(dst + ty * image_stride + tx, value * w_br);
        _atomicAdd(normalization_factor + ty * image_stride + tx, w_br);
    }

    if (tx - 1 >= 0 && tx - 1 < w && ty >= 0 && ty < h) {
        _atomicAdd(dst + ty * image_stride + (tx - 1), value * w_bl);
        _atomicAdd(normalization_factor + ty * image_stride + (tx - 1), w_bl);
    }

    if (tx - 1 >= 0 && tx - 1 < w && ty - 1 >= 0 && ty - 1 < h) {
        _atomicAdd(dst + (ty - 1) * image_stride + (tx - 1), value * w_ul);
        _atomicAdd(normalization_factor + (ty - 1) * image_stride + (tx - 1), w_ul);
    }

    if (tx >= 0 && tx < w && ty - 1 >= 0 && ty - 1 < h) {
        _atomicAdd(dst + (ty - 1) * image_stride + tx, value * w_ur);
        _atomicAdd(normalization_factor + (ty - 1) * image_stride + tx, w_ur);
    }
}