#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ForwardWarpKernel_PSF1x1(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *dst)
{
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    if (i < h && j < w)  // Combine boundary checks into one condition
    {
        int flow_row_offset = i * flow_stride;
        int image_row_offset = i * image_stride;

        float u_ = u[flow_row_offset + j];
        float v_ = v[flow_row_offset + j];

        // Calculate bottom left corner of target pixel once
        float cx = __fmul_rn(u_, time_scale) + __fadd_rn((float)j, 1.0f);
        float cy = __fmul_rn(v_, time_scale) + __fadd_rn((float)i, 1.0f);
        // Convert corner position to integer representation of pixel
        int tx = __float2int_rn(cx);
        int ty = __float2int_rn(cy);

        float value = src[image_row_offset + j];
        // Only perform atomicAdd if tx and ty are within valid bounds
        if (tx >= 0 && tx < w && ty >= 0 && ty < h)
        {
            atomicAdd(dst + ty * image_stride + tx, value);
        }
    }
}