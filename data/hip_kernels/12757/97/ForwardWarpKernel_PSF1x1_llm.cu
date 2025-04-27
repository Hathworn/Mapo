#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void ForwardWarpKernel_PSF1x1(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *dst)
{
    // Calculate linear thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int idy = blockIdx.y * blockDim.y + threadIdx.y;
    
    if (idx >= w || idy >= h) return; // Return early if out of bounds

    int flow_row_offset = idy * flow_stride;
    int image_row_offset = idy * image_stride;

    float u_ = u[flow_row_offset + idx];
    float v_ = v[flow_row_offset + idx];

    float cx = u_ * time_scale + (float)idx + 1.0f;
    float cy = v_ * time_scale + (float)idy + 1.0f;

    int tx = __float2int_rn(cx);
    int ty = __float2int_rn(cy);

    float value = src[image_row_offset + idx];

    // Check bounds and accumulate
    if (tx >= 0 && tx < w && ty >= 0 && ty < h)
    {
        atomicAdd(dst + ty * image_stride + tx, value);
    }
}