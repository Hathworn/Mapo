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

    // Consolidated flow and image row offsets
    int flow_row_offset  = i * flow_stride;
    int image_row_offset = i * image_stride;

    // Calculate bottom left corner of the target pixel
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;

    float px, py, dx, dy;
    dx = modff(cx, &px);
    dy = modff(cy, &py);

    // Target pixel integer coordinates
    int tx = (int)(px);
    int ty = (int)(py);
    float value = src[image_row_offset + j];

    // Array to hold weights
    float weights[4] = {dx * dy, (1.0f - dx) * dy, (1.0f - dx) * (1.0f - dy), dx * (1.0f - dy)};
    int dx_offsets[4] = {0, -1, -1, 0};
    int dy_offsets[4] = {0, 0, -1, -1};

    for (int k = 0; k < 4; ++k) {
        int curr_tx = tx + dx_offsets[k];
        int curr_ty = ty + dy_offsets[k];

        // Check pixel bounds
        if (!(curr_tx >= w || curr_tx < 0 || curr_ty >= h || curr_ty < 0)) {
            // Atomic addition for pixel value and normalization factor
            _atomicAdd(dst + curr_ty * image_stride + curr_tx, value * weights[k]);
            _atomicAdd(normalization_factor + curr_ty * image_stride + curr_tx, weights[k]);
        }
    }
}