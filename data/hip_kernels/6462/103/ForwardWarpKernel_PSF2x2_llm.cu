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

    // Optimized computation of target pixel coordinates
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;
    int tx = static_cast<int>(floorf(cx));
    int ty = static_cast<int>(floorf(cy));
    float dx = cx - tx;
    float dy = cy - ty;

    // Ensure tx and ty are within bounds
    if (tx < 0 || tx >= w || ty < 0 || ty >= h) return;

    float value = src[image_row_offset + j];
    float weight;

    // Unrolled and simplified atomic operations
    weight = dx * dy;
    atomicAdd(dst + ty * image_stride + tx, value * weight);
    atomicAdd(normalization_factor + ty * image_stride + tx, weight);

    tx -= 1;
    weight = (1.0f - dx) * dy;
    if (tx >= 0) {
        atomicAdd(dst + ty * image_stride + tx, value * weight);
        atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }

    ty -= 1;
    weight = (1.0f - dx) * (1.0f - dy);
    if (ty >= 0) {
        atomicAdd(dst + ty * image_stride + tx, value * weight);
        atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }

    tx += 1;
    weight = dx * (1.0f - dy);
    if (tx < w) {
        atomicAdd(dst + ty * image_stride + tx, value * weight);
        atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }
}