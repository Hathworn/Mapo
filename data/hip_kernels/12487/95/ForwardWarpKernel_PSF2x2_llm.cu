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

    // Bottom left corner of a target pixel
    float cx = u[flow_row_offset + j] * time_scale + static_cast<float>(j) + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + static_cast<float>(i) + 1.0f;
    // Pixel containing bottom left corner
    float px, py;
    float dx = modff(cx, &px);
    float dy = modff(cy, &py);
    // Target pixel integer coords
    int tx = static_cast<int>(px);
    int ty = static_cast<int>(py);
    float value = src[image_row_offset + j];
    float weight;

    // Early exit if target coordinates are out of bounds (for optimization)
    if (tx < 0 || tx >= w || ty < 0 || ty >= h) return;

    // Fill pixel containing bottom right corner
    weight = dx * dy;
    _atomicAdd(dst + ty * image_stride + tx, value * weight);
    _atomicAdd(normalization_factor + ty * image_stride + tx, weight);

    // Fill pixel containing bottom left corner
    if (tx - 1 >= 0)
    {
        weight = (1.0f - dx) * dy;
        _atomicAdd(dst + ty * image_stride + (tx - 1), value * weight);
        _atomicAdd(normalization_factor + ty * image_stride + (tx - 1), weight);
    }

    // Fill pixel containing upper left corner
    if (ty - 1 >= 0)
    {
        weight = (1.0f - dx) * (1.0f - dy);
        _atomicAdd(dst + (ty - 1) * image_stride + (tx - 1), value * weight);
        _atomicAdd(normalization_factor + (ty - 1) * image_stride + (tx - 1), weight);
    }

    // Fill pixel containing upper right corner
    if (ty - 1 >= 0 && tx >= 0)
    {
        weight = dx * (1.0f - dy);
        _atomicAdd(dst + (ty - 1) * image_stride + tx, value * weight);
        _atomicAdd(normalization_factor + (ty - 1) * image_stride + tx, weight);
    }
}