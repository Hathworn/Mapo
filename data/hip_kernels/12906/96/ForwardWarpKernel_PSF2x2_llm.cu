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

    // Pre-calculate repeatedly used variables to reduce operations
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;
    float px, py, dx, dy;
    dx = modff (cx, &px);
    dy = modff (cy, &py);
    int tx = (int) px;
    int ty = (int) py;
    float value = src[image_row_offset + j];

    float weight1 = dx * dy;
    float weight2 = (1.0f - dx) * dy;
    float weight3 = (1.0f - dx) * (1.0f - dy);
    float weight4 = dx * (1.0f - dy);

    // Combine repeated condition checks into single block to optimize branching
    if (tx >= 0 && tx < w && ty >= 0 && ty < h) {
        _atomicAdd(dst + ty * image_stride + tx, value * weight1);
        _atomicAdd(normalization_factor + ty * image_stride + tx, weight1);
    }

    tx -= 1;
    if (tx >= 0 && tx < w && ty >= 0 && ty < h) {
        _atomicAdd(dst + ty * image_stride + tx, value * weight2);
        _atomicAdd(normalization_factor + ty * image_stride + tx, weight2);
    }

    ty -= 1;
    if (tx >= 0 && tx < w && ty >= 0 && ty < h) {
        _atomicAdd(dst + ty * image_stride + tx, value * weight3);
        _atomicAdd(normalization_factor + ty * image_stride + tx, weight3);
    }

    tx += 1;
    if (tx >= 0 && tx < w && ty >= 0 && ty < h) {
        _atomicAdd(dst + ty * image_stride + tx, value * weight4);
        _atomicAdd(normalization_factor + ty * image_stride + tx, weight4);
    }
}