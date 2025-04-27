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

    // Precompute and cache reused variables
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;

    float px, py, dx, dy;
    dx = modff(cx, &px);
    dy = modff(cy, &py);

    int base_tx = (int) px;
    int base_ty = (int) py;

    float value = src[image_row_offset + j];

    // Consolidated bounds checking
    int positions[4][2] = {
        {0, 0},
        {-1, 0},
        {-1, -1},
        {0, -1}
    };

    float weights[4] = {
        dx * dy,
        (1.0f - dx) * dy,
        (1.0f - dx) * (1.0f - dy),
        dx * (1.0f - dy)
    };

    #pragma unroll
    for (int k = 0; k < 4; k++) {
        int tx = base_tx + positions[k][0];
        int ty = base_ty + positions[k][1];
        
        if (!(tx >= w || tx < 0 || ty >= h || ty < 0)) {
            float weight = weights[k];
            _atomicAdd(dst + ty * image_stride + tx, value * weight);
            _atomicAdd(normalization_factor + ty * image_stride + tx, weight);
        }
    }
}