#include "hip/hip_runtime.h"
#include "includes.h"

// Imag function remains unchanged

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void ForwardWarpKernel_PSF1x1(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *dst)
{
    // Calculate unique global thread index
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    // Exit if thread index is out of bounds
    if (i >= h || j >= w) return;

    // Precompute offsets for flow and image
    int flow_row_offset = i * flow_stride;
    int image_row_offset = i * image_stride;

    // Load u and v vectors for current pixel
    float u_ = u[flow_row_offset + j];
    float v_ = v[flow_row_offset + j];

    // Calculate bottom-left corner's target pixel coordinates
    float cx = u_ * time_scale + float(j) + 1.0f;
    float cy = v_ * time_scale + float(i) + 1.0f;

    // Round coordinates to nearest integer
    int tx = __float2int_rn(cx);
    int ty = __float2int_rn(cy);

    // Load source pixel value
    float value = src[image_row_offset + j];

    // Check bounds and perform atomic addition
    if (tx >= 0 && tx < w && ty >= 0 && ty < h)
    {
        atomicAdd(dst + ty * image_stride + tx, value);
    }
}