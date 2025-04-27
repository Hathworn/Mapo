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

    // Calculate the offset and pixel indices
    float cx = u[flow_row_offset + j] * time_scale + static_cast<float>(j) + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + static_cast<float>(i) + 1.0f;

    float px, py;
    float dx = modff(cx, &px);
    float dy = modff(cy, &py);

    int tx = static_cast<int>(px);
    int ty = static_cast<int>(py);

    float value = src[image_row_offset + j];

    // Pre-compute the weights
    float weight_br = dx * dy;
    float weight_bl = (1.0f - dx) * dy;
    float weight_tl = (1.0f - dx) * (1.0f - dy);
    float weight_tr = dx * (1.0f - dy);

    // Fill pixel containing bottom right corner
    if (tx < w && tx >= 0 && ty < h && ty >= 0)
    {
        _atomicAdd(dst + ty * image_stride + tx, value * weight_br);
        _atomicAdd(normalization_factor + ty * image_stride + tx, weight_br);
    }

    tx -= 1;
    // Fill pixel containing bottom left corner
    if (tx < w && tx >= 0 && ty < h && ty >= 0)
    {
        _atomicAdd(dst + ty * image_stride + tx, value * weight_bl);
        _atomicAdd(normalization_factor + ty * image_stride + tx, weight_bl);
    }

    ty -= 1;
    // Fill pixel containing upper left corner
    if (tx < w && tx >= 0 && ty < h && ty >= 0)
    {
        _atomicAdd(dst + ty * image_stride + tx, value * weight_tl);
        _atomicAdd(normalization_factor + ty * image_stride + tx, weight_tl);
    }

    tx += 1;
    // Fill pixel containing upper right corner
    if (tx < w && tx >= 0 && ty < h && ty >= 0)
    {
        _atomicAdd(dst + ty * image_stride + tx, value * weight_tr);
        _atomicAdd(normalization_factor + ty * image_stride + tx, weight_tr);
    }
}