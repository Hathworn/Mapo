#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void ForwardWarpKernel_PSF2x2(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *normalization_factor, float *dst)
{
    // Calculate global index for thread
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    // Exit if indices are out of bounds
    if (i >= h || j >= w) return;

    // Calculate row offsets
    int flow_row_offset  = i * flow_stride;
    int image_row_offset = i * image_stride;

    // Calculate target coordinates with time scaling applied
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;

    // Calculate pixel and fractional parts using modff
    float px, py, dx, dy;
    dx = modff(cx, &px);
    dy = modff(cy, &py);

    // Convert to integer coordinates
    int tx = (int)px;
    int ty = (int)py;

    // Precompute source pixel value
    float value = src[image_row_offset + j];
    float weight;

    // Bottom right corner
    if (tx < w && tx >= 0 && ty < h && ty >= 0) {
        weight = dx * dy;
        atomicAdd(dst + ty * image_stride + tx, value * weight);
        atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }

    // Bottom left corner
    tx -= 1;
    if (tx < w && tx >= 0 && ty < h && ty >= 0) {
        weight = (1.0f - dx) * dy;
        atomicAdd(dst + ty * image_stride + tx, value * weight);
        atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }

    // Upper left corner
    ty -= 1;
    if (tx < w && tx >= 0 && ty < h && ty >= 0) {
        weight = (1.0f - dx) * (1.0f - dy);
        atomicAdd(dst + ty * image_stride + tx, value * weight);
        atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }

    // Upper right corner
    tx += 1;
    if (tx < w && tx >= 0 && ty < h && ty >= 0) {
        weight = dx * (1.0f - dy);
        atomicAdd(dst + ty * image_stride + tx, value * weight);
        atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }
}