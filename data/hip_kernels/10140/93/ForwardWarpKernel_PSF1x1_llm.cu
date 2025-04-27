#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}
__global__ void ForwardWarpKernel_PSF1x1(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *dst)
{
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    if (i >= h || j >= w) return;

    int flow_row_offset = i * flow_stride;
    int image_row_offset = i * image_stride;

    float u_ = u[flow_row_offset + j];
    float v_ = v[flow_row_offset + j];

    // Calculate target coordinates using time scale and current indices
    float cx = fmaf(u_, time_scale, float(j) + 1.0f); // fused multiply-add for efficiency
    float cy = fmaf(v_, time_scale, float(i) + 1.0f);

    // Pixel containing bottom left corner
    int tx = __float2int_rn(cx);
    int ty = __float2int_rn(cy);

    float value = src[image_row_offset + j];

    // Check pixel boundary conditions and update destination
    if (tx >= 0 && tx < w && ty >= 0 && ty < h) 
    {
        atomicAdd(dst + ty * image_stride + tx, value); // Directly use atomicAdd for thread safety
    }
}