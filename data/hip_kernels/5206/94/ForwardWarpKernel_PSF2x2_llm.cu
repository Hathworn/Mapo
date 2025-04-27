#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void ForwardWarpKernel_PSF2x2(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *normalization_factor, float *dst)
{
    // Compute normalized thread index for better utilization
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    int i = blockIdx.y * blockDim.y + threadIdx.y;

    if (i >= h || j >= w) return;

    int flow_row_offset  = i * flow_stride;
    int image_row_offset = i * image_stride;

    // Use FMA instructions for faster computation
    float cx = __fmaf_rn(u[flow_row_offset + j], time_scale, (float)j + 1.0f);
    float cy = __fmaf_rn(v[flow_row_offset + j], time_scale, (float)i + 1.0f);

    float px, py;
    float dx = modff(cx, &px);
    float dy = modff(cy, &py);

    int tx = (int)px;
    int ty = (int)py;
    float value = src[image_row_offset + j];
    float weight;

    // Inline atomicAdd calls for pixel updates without branches
    if ((tx < w) && (tx >= 0) && (ty < h) && (ty >= 0)) {
        weight = dx * dy;
        atomicAdd(dst + ty * image_stride + tx, value * weight);
        atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }

    tx -= 1;
    if ((tx < w) && (tx >= 0) && (ty < h) && (ty >= 0)) {
        weight = (1.0f - dx) * dy;
        atomicAdd(dst + ty * image_stride + tx, value * weight);
        atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }

    ty -= 1;
    if ((tx < w) && (tx >= 0) && (ty < h) && (ty >= 0)) {
        weight = (1.0f - dx) * (1.0f - dy);
        atomicAdd(dst + ty * image_stride + tx, value * weight);
        atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }

    tx += 1;
    if ((tx < w) && (tx >= 0) && (ty < h) && (ty >= 0)) {
        weight = dx * (1.0f - dy);
        atomicAdd(dst + ty * image_stride + tx, value * weight);
        atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }
}