#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void ForwardWarpKernel_PSF1x1(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *dst)
{
    // Calculate unique global index for each thread
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    // Return early if indices are out of bounds
    if (i >= h || j >= w) return;

    // Precompute row offsets
    int flow_row_offset = i * flow_stride;
    int image_row_offset = i * image_stride;

    // Retrieve flow vector components
    float u_ = u[flow_row_offset + j];
    float v_ = v[flow_row_offset + j];

    // Compute target pixel coordinates (bottom-left corner)
    float cx = u_ * time_scale + static_cast<float>(j) + 1.0f;
    float cy = v_ * time_scale + static_cast<float>(i) + 1.0f;

    // Convert float coordinates to integer indices
    int tx = __float2int_rn(cx);
    int ty = __float2int_rn(cy);

    // Fetch source pixel value
    float value = src[image_row_offset + j];

    // Use a boundary check prior to atomic addition
    if (tx >= 0 && tx < w && ty >= 0 && ty < h)
    {
        // Perform atomic add to ensure thread safety
        atomicAdd(dst + ty * image_stride + tx, value);
    }
}