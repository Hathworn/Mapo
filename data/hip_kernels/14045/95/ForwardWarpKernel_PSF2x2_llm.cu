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
    float px, py, dx, dy;
    dx = modff(cx, &px);
    dy = modff(cy, &py);

    // Target pixel integer coordinates
    int tx = static_cast<int>(px);
    int ty = static_cast<int>(py);

    float value = src[image_row_offset + j];

    // Precompute weights for efficiency
    float dxdy = dx * dy;
    float dx1dy = (1.0f - dx) * dy;
    float dxdy1 = dx * (1.0f - dy);
    float dx1dy1 = (1.0f - dx) * (1.0f - dy);

    // Fill pixels using precomputed weights
    // Bottom right corner
    if (tx < w && tx >= 0 && ty < h && ty >= 0)
    {
        _atomicAdd(dst + ty * image_stride + tx, value * dxdy);
        _atomicAdd(normalization_factor + ty * image_stride + tx, dxdy);
    }

    // Bottom left corner
    tx -= 1;
    if (tx < w && tx >= 0 && ty < h && ty >= 0)
    {
        _atomicAdd(dst + ty * image_stride + tx, value * dx1dy);
        _atomicAdd(normalization_factor + ty * image_stride + tx, dx1dy);
    }

    // Upper left corner
    ty -= 1;
    if (tx < w && tx >= 0 && ty < h && ty >= 0)
    {
        _atomicAdd(dst + ty * image_stride + tx, value * dx1dy1);
        _atomicAdd(normalization_factor + ty * image_stride + tx, dx1dy1);
    }

    // Upper right corner
    tx += 1;
    if (tx < w && tx >= 0 && ty < h && ty >= 0)
    {
        _atomicAdd(dst + ty * image_stride + tx, value * dxdy1);
        _atomicAdd(normalization_factor + ty * image_stride + tx, dxdy1);
    }
}