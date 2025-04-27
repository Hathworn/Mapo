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

    // Calculate coordinates for the corners
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;
    float px, py;
    float dx = modff(cx, &px);
    float dy = modff(cy, &py);
    int tx = (int) px;
    int ty = (int) py;
    float value = src[image_row_offset + j];
    float weight;

    // Helper lambda to update dst and normalization_factor
    auto update_pixel = [&](int x, int y, float weight) {
        if (x >= 0 && x < w && y >= 0 && y < h) {
            int idx = y * image_stride + x;
            atomicAdd(dst + idx, value * weight);
            atomicAdd(normalization_factor + idx, weight);
        }
    };

    // Fill pixels using calculated weights
    update_pixel(tx, ty, dx * dy);
    update_pixel(tx - 1, ty, (1.0f - dx) * dy);
    update_pixel(tx - 1, ty - 1, (1.0f - dx) * (1.0f - dy));
    update_pixel(tx, ty - 1, dx * (1.0f - dy));
}