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

    // Precompute common indices
    int flow_row_offset  = i * flow_stride + j;
    int image_row_offset = i * image_stride + j;
    float value = src[image_row_offset];

    // Compute the position and offsets
    float cx = u[flow_row_offset] * time_scale + static_cast<float>(j) + 1.0f;
    float cy = v[flow_row_offset] * time_scale + static_cast<float>(i) + 1.0f;

    // pixel containing bottom left corner
    float px, py, dx, dy;
    dx = modff(cx, &px);
    dy = modff(cy, &py);

    int tx = static_cast<int>(px);
    int ty = static_cast<int>(py);

    // Macro to avoid repetitive code for checking bounds and updating
    #define UPDATE_PIXEL(cond, x_offset, y_offset, d_x, d_y) \
        if (cond) { \
            weight = (d_x) * (d_y); \
            int index = (ty + (y_offset)) * image_stride + (tx + (x_offset)); \
            _atomicAdd(dst + index, value * weight); \
            _atomicAdd(normalization_factor + index, weight); \
        }

    float weight;
    // Fill pixels with calculated weights
    UPDATE_PIXEL(!(tx >= w || tx < 0 || ty >= h || ty < 0), 0, 0, dx, dy)               // Bottom right
    UPDATE_PIXEL(!(tx - 1 >= w || tx - 1 < 0 || ty >= h || ty < 0), -1, 0, 1.0f - dx, dy) // Bottom left
    UPDATE_PIXEL(!(tx - 1 >= w || tx - 1 < 0 || ty - 1 >= h || ty - 1 < 0), -1, -1, 1.0f - dx, 1.0f - dy) // Upper left
    UPDATE_PIXEL(!(tx >= w || tx < 0 || ty - 1 >= h || ty - 1 < 0), 0, -1, dx, 1.0f - dy) // Upper right

    #undef UPDATE_PIXEL
}