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

    // Precompute values to reduce recalculation
    float j_f = static_cast<float>(j);
    float i_f = static_cast<float>(i);

    // bottom left corner of a target pixel
    float cx = u[flow_row_offset + j] * time_scale + j_f + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + i_f + 1.0f;

    float px, py;
    float dx = modff(cx, &px);
    float dy = modff(cy, &py);

    int tx = static_cast<int>(px);
    int ty = static_cast<int>(py);
    float value = src[image_row_offset + j];

    float weight;

    // Combined boundary condition check to reduce redundant checks
    bool in_bounds_bl = (tx >= 0) && (tx < w) && (ty >= 0) && (ty < h);
    bool in_bounds_br = (tx + 1 >= 0) && (tx + 1 < w) && (ty >= 0) && (ty < h);
    bool in_bounds_ul = (tx >= 0) && (tx < w) && (ty - 1 >= 0) && (ty - 1 < h);
    bool in_bounds_ur = (tx + 1 >= 0) && (tx + 1 < w) && (ty - 1 >= 0) && (ty - 1 < h);

    // fill pixel containing bottom left corner
    if (in_bounds_bl)
    {
        weight = (1.0f - dx) * dy;
        _atomicAdd(dst + ty * image_stride + tx, value * weight);
        _atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }

    // fill pixel containing bottom right corner
    if (in_bounds_br)
    {
        weight = dx * dy;
        _atomicAdd(dst + ty * image_stride + (tx + 1), value * weight);
        _atomicAdd(normalization_factor + ty * image_stride + (tx + 1), weight);
    }

    // fill pixel containing upper left corner
    if (in_bounds_ul)
    {
        weight = (1.0f - dx) * (1.0f - dy);
        _atomicAdd(dst + (ty - 1) * image_stride + tx, value * weight);
        _atomicAdd(normalization_factor + (ty - 1) * image_stride + tx, weight);
    }

    // fill pixel containing upper right corner
    if (in_bounds_ur)
    {
        weight = dx * (1.0f - dy);
        _atomicAdd(dst + (ty - 1) * image_stride + (tx + 1), value * weight);
        _atomicAdd(normalization_factor + (ty - 1) * image_stride + (tx + 1), weight);
    }
}