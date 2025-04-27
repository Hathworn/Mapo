#include "hip/hip_runtime.h"
#include "includes.h"

// Maintain the imag function as is

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

// Optimized kernel function
__global__ void ForwardWarpKernel_PSF1x1(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *dst)
{
    // Calculate indices
    int j = threadIdx.x + blockIdx.x * blockDim.x;
    int i = threadIdx.y + blockIdx.y * blockDim.y;

    // Check boundaries
    if (i >= h || j >= w) return;

    // Calculate row offsets once
    int flow_row_offset = i * flow_stride;
    int image_row_offset = i * image_stride;

    // Load flows
    float u_ = u[flow_row_offset + j];
    float v_ = v[flow_row_offset + j];

    // Calculate the warped pixel position
    float cx = u_ * time_scale + static_cast<float>(j) + 1.0f;
    float cy = v_ * time_scale + static_cast<float>(i) + 1.0f;

    // Determine target pixel
    int tx = __float2int_rn(cx);
    int ty = __float2int_rn(cy);

    // Retrieve source value
    float value = src[image_row_offset + j];

    // Use atomic add to accumulate the value conditionally
    if (tx >= 0 && tx < w && ty >= 0 && ty < h)
    {
        // Ensure atomic addition only within valid bounds
        atomicAdd(dst + ty * image_stride + tx, value);
    }
}