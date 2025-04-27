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

    // bottom left corner of a target pixel
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;

    // pixel containing bottom left corner
    float px, py;
    float dx = modff(cx, &px);
    float dy = modff(cy, &py);

    // target pixel integer coords
    int tx = (int) px;
    int ty = (int) py;

    float value = src[image_row_offset + j];
    float weight;

    // Calculate weights and update in a single loop
    float weights[4] = { dx * dy, (1.0f - dx) * dy, (1.0f - dx) * (1.0f - dy), dx * (1.0f - dy) };
    int tx_offsets[4] = { 0, -1, -1, 0 };
    int ty_offsets[4] = { 0, 0, -1, -1 };

    for (int idx = 0; idx < 4; ++idx) {
        int new_tx = tx + tx_offsets[idx];
        int new_ty = ty + ty_offsets[idx];

        if (!(new_tx >= w || new_tx < 0 || new_ty >= h || new_ty < 0)) {
            weight = weights[idx];
            _atomicAdd(dst + new_ty * image_stride + new_tx, value * weight);
            _atomicAdd(normalization_factor + new_ty * image_stride + new_tx, weight);
        }
    }
}