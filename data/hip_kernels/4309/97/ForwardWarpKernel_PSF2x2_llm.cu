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

    int flow_row_offset  = i * flow_stride;
    int image_row_offset = i * image_stride;

    // Precompute cx, cy, dx, dy, and value
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;
    float px, py, dx, dy;
    dx = modff(cx, &px);
    dy = modff(cy, &py);
    int tx = (int)px;
    int ty = (int)py;
    float value = src[image_row_offset + j];

    // Merge condition checks and atomic adds
    #pragma unroll 4
    for (int offset_x = 0; offset_x <= 1; ++offset_x)
    {
        for (int offset_y = 0; offset_y <= 1; ++offset_y)
        {
            int adj_tx = tx - offset_x;
            int adj_ty = ty - offset_y;
            if (adj_tx >= 0 && adj_tx < w && adj_ty >= 0 && adj_ty < h)
            {
                float weight = (offset_x ? dx : 1.0f - dx) * (offset_y ? dy : 1.0f - dy);
                atomicAdd(dst + adj_ty * image_stride + adj_tx, value * weight);
                atomicAdd(normalization_factor + adj_ty * image_stride + adj_tx, weight);
            }
        }
    }
}