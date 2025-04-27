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

    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;

    float px, py, dx, dy;
    dx = modff(cx, &px);
    dy = modff(cy, &py);

    int tx = (int)px;
    int ty = (int)py;

    float value = src[image_row_offset + j];
    float weight;

    // Consolidate boundary checks and atomic adds
    for (int x_offset = 0; x_offset <= 1; ++x_offset) {
        for (int y_offset = 0; y_offset <= 1; ++y_offset) {
            int ntx = tx - 1 + x_offset;
            int nty = ty - 1 + y_offset;
            if (ntx >= 0 && ntx < w && nty >= 0 && nty < h) {
                weight = ((x_offset == 0) ? (1.0f - dx) : dx) * ((y_offset == 0) ? (1.0f - dy) : dy);
                int index = nty * image_stride + ntx;
                _atomicAdd(dst + index, value * weight);
                _atomicAdd(normalization_factor + index, weight);
            }
        }
    }
}