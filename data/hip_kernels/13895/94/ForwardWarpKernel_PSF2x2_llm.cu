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

    // Precompute displacement values
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;
    float px, py, dx, dy;
    dx = modff(cx, &px);
    dy = modff(cy, &py);
    int tx = (int)px;
    int ty = (int)py;
    float value = src[image_row_offset + j];
    float weight;

    // Precompute boundary check conditions
    bool withinBoundsBR = (tx < w) && (tx >= 0) && (ty < h) && (ty >= 0);
    bool withinBoundsBL = ((tx-1) < w) && ((tx-1) >= 0) && (ty < h) && (ty >= 0);
    bool withinBoundsUL = ((tx-1) < w) && ((tx-1) >= 0) && ((ty-1) < h) && ((ty-1) >= 0);
    bool withinBoundsUR = (tx < w) && (tx >= 0) && ((ty-1) < h) && ((ty-1) >= 0);

    // Fill pixel containing bottom right corner
    if (withinBoundsBR) {
        weight = dx * dy;
        _atomicAdd(dst + ty * image_stride + tx, value * weight);
        _atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }

    // Fill pixel containing bottom left corner
    if (withinBoundsBL) {
        weight = (1.0f - dx) * dy;
        _atomicAdd(dst + ty * image_stride + (tx - 1), value * weight);
        _atomicAdd(normalization_factor + ty * image_stride + (tx - 1), weight);
    }

    // Fill pixel containing upper left corner
    if (withinBoundsUL) {
        weight = (1.0f - dx) * (1.0f - dy);
        _atomicAdd(dst + (ty - 1) * image_stride + (tx - 1), value * weight);
        _atomicAdd(normalization_factor + (ty - 1) * image_stride + (tx - 1), weight);
    }

    // Fill pixel containing upper right corner
    if (withinBoundsUR) {
        weight = dx * (1.0f - dy);
        _atomicAdd(dst + (ty - 1) * image_stride + tx, value * weight);
        _atomicAdd(normalization_factor + (ty - 1) * image_stride + tx, weight);
    }
}