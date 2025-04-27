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

    int flow_row_offset = i * flow_stride;
    int image_row_offset = i * image_stride;

    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;
    float px, py;
    float dx = modff(cx, &px);
    float dy = modff(cy, &py);
    int tx = (int)px;
    int ty = (int)py;
    float value = src[image_row_offset + j];

    // Optimize memory access by using shared variables for weight computations
    float weights[] = {dx * dy, (1.0f - dx) * dy, (1.0f - dx) * (1.0f - dy), dx * (1.0f - dy)};
    int offsets[][2] = {{0, 0}, {-1, 0}, {-1, -1}, {0, -1}};

    for (int k = 0; k < 4; ++k) {
        int x = tx + offsets[k][0];
        int y = ty + offsets[k][1];
        if (!(x >= w || x < 0 || y >= h || y < 0)) {
            float weight = weights[k];
            atomicAdd(dst + y * image_stride + x, value * weight);
            atomicAdd(normalization_factor + y * image_stride + x, weight);
        }
    }
}