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

    // Pre-compute time scaled positions
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;

    float px, py;
    float dx = modff (cx, &px);
    float dy = modff (cy, &py);

    // Cast to integer coordinates
    int tx = (int) px;
    int ty = (int) py;
    float value = src[image_row_offset + j];

    // Precompute weights for efficiency
    float w_br = dx * dy; // bottom right
    float w_bl = (1.0f - dx) * dy; // bottom left
    float w_ul = (1.0f - dx) * (1.0f - dy); // upper left
    float w_ur = dx * (1.0f - dy); // upper right
    
    // Accumulate results using precomputed weights
    if (tx < w && tx >= 0 && ty < h && ty >= 0) {
        _atomicAdd(dst + ty * image_stride + tx, value * w_br);
        _atomicAdd(normalization_factor + ty * image_stride + tx, w_br);
    }

    tx -= 1;
    if (tx < w && tx >= 0 && ty < h && ty >= 0) {
        _atomicAdd(dst + ty * image_stride + tx, value * w_bl);
        _atomicAdd(normalization_factor + ty * image_stride + tx, w_bl);
    }

    ty -= 1;
    if (tx < w && tx >= 0 && ty < h && ty >= 0) {
        _atomicAdd(dst + ty * image_stride + tx, value * w_ul);
        _atomicAdd(normalization_factor + ty * image_stride + tx, w_ul);
    }

    tx += 1;
    if (tx < w && tx >= 0 && ty < h && ty >= 0) {
        _atomicAdd(dst + ty * image_stride + tx, value * w_ur);
        _atomicAdd(normalization_factor + ty * image_stride + tx, w_ur);
    }
}