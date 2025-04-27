#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ForwardWarpKernel_PSF2x2(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *normalization_factor, float *dst)
{
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    if (i >= h || j >= w) return;

    int flow_row_offset  = i * flow_stride;
    int image_row_offset = i * image_stride;

    float cx = u[flow_row_offset + j] * time_scale + static_cast<float>(j) + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + static_cast<float>(i) + 1.0f;
    float px;
    float py;
    float dx = modff(cx, &px);
    float dy = modff(cy, &py);
    int tx = static_cast<int>(px);
    int ty = static_cast<int>(py);
    float value = src[image_row_offset + j];
    float weight;

    // Use a loop to reduce repetition
    float corner_weights[4] = { dx * dy, (1.0f - dx) * dy, (1.0f - dx) * (1.0f - dy), dx * (1.0f - dy) };
    int x_offsets[4] = { 0, -1, -1, 0 };
    int y_offsets[4] = { 0, 0, -1, -1 };

    for (int idx = 0; idx < 4; ++idx) {
        int cur_tx = tx + x_offsets[idx];
        int cur_ty = ty + y_offsets[idx];
        if (cur_tx >= 0 && cur_tx < w && cur_ty >= 0 && cur_ty < h) {
            weight = corner_weights[idx];
            _atomicAdd(dst + cur_ty * image_stride + cur_tx, value * weight);
            _atomicAdd(normalization_factor + cur_ty * image_stride + cur_tx, weight);
        }
    }
}