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

    // Precompute scaled flow + position
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;

    // Break into integer and fractional parts
    float px, py;
    float dx = modff(cx, &px);
    float dy = modff(cy, &py);

    // Target pixel integer coordinates
    int tx = int(px);
    int ty = int(py);

    float value = src[image_row_offset + j];
    
    // Common condition check
    if (tx < 0 || tx >= w || ty < 0 || ty >= h) return;

    // Compute weight and update pixels
    float weight = dx * dy;
    atomicAdd(&dst[ty * image_stride + tx], value * weight);
    atomicAdd(&normalization_factor[ty * image_stride + tx], weight);

    // Bottom left: (tx-1, ty)
    if (tx > 0) {
        weight = (1.0f - dx) * dy;
        atomicAdd(&dst[ty * image_stride + (tx - 1)], value * weight);
        atomicAdd(&normalization_factor[ty * image_stride + (tx - 1)], weight);
    }

    // Upper left: (tx-1, ty-1)
    if (tx > 0 && ty > 0) {
        weight = (1.0f - dx) * (1.0f - dy);
        atomicAdd(&dst[(ty - 1) * image_stride + (tx - 1)], value * weight);
        atomicAdd(&normalization_factor[(ty - 1) * image_stride + (tx - 1)], weight);
    }

    // Upper right: (tx, ty-1)
    if (ty > 0) {
        weight = dx * (1.0f - dy);
        atomicAdd(&dst[(ty - 1) * image_stride + tx], value * weight);
        atomicAdd(&normalization_factor[(ty - 1) * image_stride + tx], weight);
    }
}