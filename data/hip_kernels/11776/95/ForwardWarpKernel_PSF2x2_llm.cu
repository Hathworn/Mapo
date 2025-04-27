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

    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;
    
    float px, py, dx, dy;
    dx = modff(cx, &px);
    dy = modff(cy, &py);
    
    int tx = (int)px;
    int ty = (int)py;
    float value = src[image_row_offset + j];
    float weight;

    // Optimize pixel fill checks
    #pragma unroll
    for (int offset = 0; offset < 4; ++offset)
    {
        int x_offset = (offset == 1 || offset == 3) ? -1 : 0;
        int y_offset = (offset >= 2) ? -1 : 0;
        
        int current_tx = tx + x_offset;
        int current_ty = ty + y_offset;

        if (!(current_tx >= w || current_tx < 0 || current_ty >= h || current_ty < 0))
        {
            weight = ((offset % 2 == 0) ? dx : (1.0f - dx)) * ((offset < 2) ? dy : (1.0f - dy));
            _atomicAdd(dst + current_ty * image_stride + current_tx, value * weight);
            _atomicAdd(normalization_factor + current_ty * image_stride + current_tx, weight);
        }
    }
}