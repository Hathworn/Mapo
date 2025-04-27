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

    int flow_row_offset = i * flow_stride;
    int image_row_offset = i * image_stride;

    // Calculate target pixel coordinates
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;
    float px, py;
    float dx = modff(cx, &px);
    float dy = modff(cy, &py);
    int tx = (int)px;
    int ty = (int)py;
    float value = src[image_row_offset + j];
    
    // Pre-calculate weights
    float w_bottom_right = dx * dy;
    float w_bottom_left = (1.0f - dx) * dy;
    float w_upper_left = (1.0f - dx) * (1.0f - dy);
    float w_upper_right = dx * (1.0f - dy);

    // Fill pixel containing bottom right corner
    if (!(tx >= w || tx < 0 || ty >= h || ty < 0))
    {
        _atomicAdd(dst + ty * image_stride + tx, value * w_bottom_right);
        _atomicAdd(normalization_factor + ty * image_stride + tx, w_bottom_right);
    }

    // Fill pixel containing bottom left corner
    tx -= 1;
    if (!(tx >= w || tx < 0 || ty >= h || ty < 0))
    {
        _atomicAdd(dst + ty * image_stride + tx, value * w_bottom_left);
        _atomicAdd(normalization_factor + ty * image_stride + tx, w_bottom_left);
    }

    // Fill pixel containing upper left corner
    ty -= 1;
    if (!(tx >= w || tx < 0 || ty >= h || ty < 0))
    {
        _atomicAdd(dst + ty * image_stride + tx, value * w_upper_left);
        _atomicAdd(normalization_factor + ty * image_stride + tx, w_upper_left);
    }

    // Fill pixel containing upper right corner
    tx += 1;
    if (!(tx >= w || tx < 0 || ty >= h || ty < 0))
    {
        _atomicAdd(dst + ty * image_stride + tx, value * w_upper_right);
        _atomicAdd(normalization_factor + ty * image_stride + tx, w_upper_right);
    }
}