#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void ForwardWarpKernel_PSF1x1(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *dst)
{
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    int i = blockIdx.y * blockDim.y + threadIdx.y;

    if (i < h && j < w)  // Simplified boundary condition check
    {
        int flow_row_offset = i * flow_stride;
        int image_row_offset = i * image_stride;

        float u_ = u[flow_row_offset + j];
        float v_ = v[flow_row_offset + j];

        // Compute the target pixel positions
        float cx = u_ * time_scale + (float)j + 1.0f;
        float cy = v_ * time_scale + (float)i + 1.0f;

        // Pixel location with rounding
        int tx = __float2int_rn(cx);
        int ty = __float2int_rn(cy);

        float value = src[image_row_offset + j];

        // Check boundary and perform atomic addition
        if (tx >= 0 && tx < w && ty >= 0 && ty < h)  // Adjusted boundary checks
        {
            atomicAdd(&dst[ty * image_stride + tx], value);
        }
    }
}