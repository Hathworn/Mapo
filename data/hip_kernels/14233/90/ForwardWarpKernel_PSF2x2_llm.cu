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

    // Optimize pre-computation of common expressions
    float u_val = u[flow_row_offset + j] * time_scale;
    float v_val = v[flow_row_offset + j] * time_scale;
    float cx = u_val + static_cast<float>(j) + 1.0f;
    float cy = v_val + static_cast<float>(i) + 1.0f;

    float px, py;
    float dx = modff (cx, &px);
    float dy = modff (cy, &py);
    float value = src[image_row_offset + j];

    // Use inbounds function to reduce repeated checks
    auto inbounds = [&](int x, int y) -> bool { return (x >= 0 && x < w && y >= 0 && y < h); };

    int tx = static_cast<int>(px);
    int ty = static_cast<int>(py);

    // Pixel bottom right
    if (inbounds(tx, ty)) {
        float weight = dx * dy;
        atomicAdd(dst + ty * image_stride + tx, value * weight);
        atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }

    // Pixel bottom left
    tx -= 1;
    if (inbounds(tx, ty)) {
        float weight = (1.0f - dx) * dy;
        atomicAdd(dst + ty * image_stride + tx, value * weight);
        atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }

    // Pixel upper left
    ty -= 1;
    if (inbounds(tx, ty)) {
        float weight = (1.0f - dx) * (1.0f - dy);
        atomicAdd(dst + ty * image_stride + tx, value * weight);
        atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }

    // Pixel upper right
    tx += 1;
    if (inbounds(tx, ty)) {
        float weight = dx * (1.0f - dy);
        atomicAdd(dst + ty * image_stride + tx, value * weight);
        atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }
}