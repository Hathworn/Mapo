#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void ForwardWarpKernel_PSF1x1(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *dst)
{
    int j = blockDim.x * blockIdx.x + threadIdx.x;
    int i = blockDim.y * blockIdx.y + threadIdx.y;

    if (i < h && j < w) {  // Efficient boundary check
        int flow_row_offset = i * flow_stride + j;
        int image_row_offset = i * image_stride + j;

        float u_ = u[flow_row_offset];
        float v_ = v[flow_row_offset];

        // Calculate coordinates
        float cx = u_ * time_scale + j + 1.0f;
        float cy = v_ * time_scale + i + 1.0f;
        int tx = __float2int_rn(cx);
        int ty = __float2int_rn(cy);

        // Read source pixel
        float value = src[image_row_offset];

        // Check and update destination
        if (tx >= 0 && tx < w && ty >= 0 && ty < h) {  // Simplified condition
            atomicAdd(&dst[ty * image_stride + tx], value);  // Use atomicAdd directly on the pointer
        }
    }
}