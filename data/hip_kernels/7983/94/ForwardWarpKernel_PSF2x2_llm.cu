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

    // Compute target pixel position
    float cx = u[flow_row_offset + j] * time_scale + j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + i + 1.0f;

    // Decompose to integer and fractional parts
    float px, py;
    float dx = modff(cx, &px);
    float dy = modff(cy, &py);

    // Target pixel integer coordinates
    int tx = (int)px;
    int ty = (int)py;
    float value = src[image_row_offset + j];
    float weight;

    // Compute weights and update the corresponding pixels
    float weights[4] = {
        dx * dy,
        (1.0f - dx) * dy,
        (1.0f - dx) * (1.0f - dy),
        dx * (1.0f - dy)
    };

    int offsets[4][2] = {
        {0,  0},
        {-1, 0},
        {-1, -1},
        {0, -1}
    };

    #pragma unroll
    for (int k = 0; k < 4; ++k) {
        int cur_tx = tx + offsets[k][0];
        int cur_ty = ty + offsets[k][1];
        if ((cur_tx >= 0) && (cur_tx < w) && (cur_ty >= 0) && (cur_ty < h)) {
            int idx = cur_ty * image_stride + cur_tx;
            _atomicAdd(dst + idx, value * weights[k]);
            _atomicAdd(normalization_factor + idx, weights[k]);
        }
    }
}