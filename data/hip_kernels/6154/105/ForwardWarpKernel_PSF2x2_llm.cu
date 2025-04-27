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

    // Compute the bottom left corner of the target pixel
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;
    float px, py;
    float dx = modff(cx, &px);
    float dy = modff(cy, &py);

    int tx = (int)px;
    int ty = (int)py;
    float value = src[image_row_offset + j];

    // Precompute frequently used terms
    float dxdy = dx * dy;
    float dx1 = 1.0f - dx;
    float dy1 = 1.0f - dy;
    
    // Fill pixel containing bottom right corner
    if (tx >= 0 && tx < w && ty >= 0 && ty < h) {
        float weight = dxdy;
        atomicAdd(dst + ty * image_stride + tx, value * weight);  // Use atomicAdd directly for efficiency
        atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }

    // Fill pixel containing bottom left corner
    tx -= 1;
    if (tx >= 0 && tx < w && ty >= 0 && ty < h) {
        float weight = dx1 * dy;
        atomicAdd(dst + ty * image_stride + tx, value * weight);
        atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }

    // Fill pixel containing upper left corner
    ty -= 1;
    if (tx >= 0 && tx < w && ty >= 0 && ty < h) {
        float weight = dx1 * dy1;
        atomicAdd(dst + ty * image_stride + tx, value * weight);
        atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }

    // Fill pixel containing upper right corner
    tx += 1;
    if (tx >= 0 && tx < w && ty >= 0 && ty < h) {
        float weight = dx * dy1;
        atomicAdd(dst + ty * image_stride + tx, value * weight);
        atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }
}