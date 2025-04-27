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

    // Compute target pixel's float coordinates
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;

    // Split target coordinates into integer and fractional parts
    float px, py, dx, dy;
    dx = modff(cx, &px);
    dy = modff(cy, &py);

    // Integer target pixel coordinates
    int tx = static_cast<int>(px);
    int ty = static_cast<int>(py);
    float value = src[image_row_offset + j];
    
    // Atomic update only if target coordinates are within bounds
    float weight;
    if (tx >= 0 && tx < w && ty >= 0 && ty < h) {
        weight = dx * dy;
        atomicAdd(&dst[ty * image_stride + tx], value * weight);
        atomicAdd(&normalization_factor[ty * image_stride + tx], weight);
    }
    
    tx -= 1; // Bottom-left corner
    if (tx >= 0 && tx < w && ty >= 0 && ty < h) {
        weight = (1.0f - dx) * dy;
        atomicAdd(&dst[ty * image_stride + tx], value * weight);
        atomicAdd(&normalization_factor[ty * image_stride + tx], weight);
    }

    ty -= 1; // Upper-left corner
    if (tx >= 0 && tx < w && ty >= 0 && ty < h) {
        weight = (1.0f - dx) * (1.0f - dy);
        atomicAdd(&dst[ty * image_stride + tx], value * weight);
        atomicAdd(&normalization_factor[ty * image_stride + tx], weight);
    }

    tx += 1; // Upper-right corner
    if (tx >= 0 && tx < w && ty >= 0 && ty < h) {
        weight = dx * (1.0f - dy);
        atomicAdd(&dst[ty * image_stride + tx], value * weight);
        atomicAdd(&normalization_factor[ty * image_stride + tx], weight);
    }
}