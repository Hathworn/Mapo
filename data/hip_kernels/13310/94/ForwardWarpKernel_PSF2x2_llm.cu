```c
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

    // Precompute source pixel's position in target space
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;

    // Calculate integer and fractional parts
    float px, py;
    float dx = modff(cx, &px);
    float dy = modff(cy, &py);

    // Convert to integer target coordinates
    int tx = static_cast<int>(px);
    int ty = static_cast<int>(py);

    // Early exit if the source pixel contributes to no valid target pixels
    if (tx < -1 || tx > w || ty < -1 || ty > h) return;

    float value = src[image_row_offset + j];
    float weight;

    // Optimize bounds check by handling all cases in a single trajectory iteration
    #pragma unroll 4
    for (int offset = 0; offset < 4; ++offset)
    {
        int x = tx + ((offset >> 1) & 1);
        int y = ty + (offset & 1);

        if (x >= 0 && x < w && y >= 0 && y < h)
        {
            weight = ((offset & 1) ? dx : (1.0f - dx)) * (((offset >> 1) & 1) ? dy : (1.0f - dy));
            _atomicAdd(dst + y * image_stride + x, value * weight);
            _atomicAdd(normalization_factor + y * image_stride + x, weight);
        }
    }
}