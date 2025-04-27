#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void ForwardWarpKernel_PSF1x1(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *dst)
{
    // Calculate global thread indices for i and j
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    // Return if the indices are out of bounds
    if (i >= h || j >= w) return;

    int flow_row_offset = i * flow_stride;
    int image_row_offset = i * image_stride;

    // Load u and v components
    float u_ = u[flow_row_offset + j];
    float v_ = v[flow_row_offset + j];

    // Calculate target pixel's bottom left corner (cx, cy)
    float cx = u_ * time_scale + (float)j + 1.0f;
    float cy = v_ * time_scale + (float)i + 1.0f;

    // Convert float coordinates to integer pixel indices
    int tx = __float2int_rn(cx);
    int ty = __float2int_rn(cy);

    // Load the value from the source
    float value = src[image_row_offset + j];

    // Check if target pixel indices are within bounds and atomically add value
    if (tx >= 0 && tx < w && ty >= 0 && ty < h)
    {
        atomicAdd(dst + ty * image_stride + tx, value);
    }
}