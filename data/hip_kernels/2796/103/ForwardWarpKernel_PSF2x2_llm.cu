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

    // Calculate subpixel positions and weights
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;
    float px, py;
    float dx = modff(cx, &px);
    float dy = modff(cy, &py);
    int value_idx = image_row_offset + j;
    float value = src[value_idx];

    // Precompute target pixel positions and weights
    int coords[4][2] = {{(int)px, (int)py}, {(int)px - 1, (int)py}, {(int)px - 1, (int)py - 1}, {(int)px, (int)py - 1}};
    float weights[4] = {dx * dy, (1.0f - dx) * dy, (1.0f - dx) * (1.0f - dy), dx * (1.0f - dy)};

    // Iterate over all corners and update accumulation
    for (int n = 0; n < 4; ++n) {
        int tx = coords[n][0];
        int ty = coords[n][1];
        if (tx >= 0 && tx < w && ty >= 0 && ty < h) { // Simplified bounds check
            float weight = weights[n];
            int target_idx = ty * image_stride + tx;
            _atomicAdd(dst + target_idx, value * weight);
            _atomicAdd(normalization_factor + target_idx, weight);
        }
    }
}