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

    // Calculate bottom left corner
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;
    float px, py;
    float dx = modff (cx, &px);
    float dy = modff (cy, &py);
    int tx = (int) px;
    int ty = (int) py;
    float value = src[image_row_offset + j];

    // Optimize bounds check and atomic add into a helper lambda
    auto atomicAddIfInBounds = [&](int x, int y, float weight) {
        if (!((x >= w) || (x < 0) || (y >= h) || (y < 0))) {
            _atomicAdd(dst + y * image_stride + x, value * weight);
            _atomicAdd(normalization_factor + y * image_stride + x, weight);
        }
    };

    // Fill pixels using helper
    atomicAddIfInBounds(tx, ty, dx * dy);                // Bottom right
    atomicAddIfInBounds(tx - 1, ty, (1.0f - dx) * dy);   // Bottom left
    atomicAddIfInBounds(tx - 1, ty - 1, (1.0f - dx) * (1.0f - dy)); // Upper left
    atomicAddIfInBounds(tx, ty - 1, dx * (1.0f - dy));   // Upper right
}