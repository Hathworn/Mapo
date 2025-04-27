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

    // Bottom left corner of a target pixel
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;
    
    // Pixel containing bottom left corner
    float px, py;
    float dx = modff(cx, &px);
    float dy = modff(cy, &py);
    
    // Target pixel integer coords
    int tx = (int)px;
    int ty = (int)py;
    float value = src[image_row_offset + j];

    // Cache computations to avoid repeated calculations
    float dx1 = 1.0f - dx;
    float dy1 = 1.0f - dy;

    // Fill pixel containing bottom right corner
    if (tx >= 0 && tx < w && ty >= 0 && ty < h)
    {
        float weight = dx * dy;
        _atomicAdd(dst + ty * image_stride + tx, value * weight);
        _atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }

    // Fill pixel containing bottom left corner
    tx -= 1;
    if (tx >= 0 && tx < w && ty >= 0 && ty < h)
    {
        float weight = dx1 * dy;
        _atomicAdd(dst + ty * image_stride + tx, value * weight);
        _atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }

    // Fill pixel containing upper left corner
    ty -= 1;
    if (tx >= 0 && tx < w && ty >= 0 && ty < h)
    {
        float weight = dx1 * dy1;
        _atomicAdd(dst + ty * image_stride + tx, value * weight);
        _atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }

    // Fill pixel containing upper right corner
    tx += 1;
    if (tx >= 0 && tx < w && ty >= 0 && ty < h)
    {
        float weight = dx * dy1;
        _atomicAdd(dst + ty * image_stride + tx, value * weight);
        _atomicAdd(normalization_factor + ty * image_stride + tx, weight);
    }
}