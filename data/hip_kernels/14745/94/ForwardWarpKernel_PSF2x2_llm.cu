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

    // Compute target pixel coordinates
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;
    float px, py, dx = modff(cx, &px), dy = modff(cy, &py);
    int tx = (int) px, ty = (int) py;
    float value = src[image_row_offset + j];

    // Precompute weights
    float weights[4] = { dx * dy, (1.0f - dx) * dy, (1.0f - dx) * (1.0f - dy), dx * (1.0f - dy) };
    int offsets[2][4] = { {0, -1, -1, 0}, {0, 0, -1, -1} };

    #pragma unroll 4 // Unroll the loop for efficiency
    for (int k = 0; k < 4; ++k) {
        int x = tx + offsets[0][k];
        int y = ty + offsets[1][k];
        if (x >= 0 && x < w && y >= 0 && y < h) {
            float weight = weights[k];
            _atomicAdd(dst + y * image_stride + x, value * weight);
            _atomicAdd(normalization_factor + y * image_stride + x, weight);
        }
    }
}