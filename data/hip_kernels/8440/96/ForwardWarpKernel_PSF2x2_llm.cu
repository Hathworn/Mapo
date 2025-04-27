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

    // Pre-compute commonly used values
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;

    float value = src[image_row_offset + j];
    
    float px, py, dx, dy, weight;
    int tx, ty;

    dx = modff(cx, &px);
    dy = modff(cy, &py);

    tx = (int)px;
    ty = (int)py;

    // Use loop unrolling for efficiency
    #pragma unroll
    for (int shift = 0; shift < 4; ++shift) {
        if (!((tx >= w) || (tx < 0) || (ty >= h) || (ty < 0))) {
            switch (shift) {
                case 0: weight = dx * dy; break; // Bottom-right corner
                case 1: weight = (1.0f - dx) * dy; tx -= 1; break; // Bottom-left corner
                case 2: weight = (1.0f - dx) * (1.0f - dy); ty -= 1; break; // Upper-left corner
                case 3: weight = dx * (1.0f - dy); tx += 1; break; // Upper-right corner
            }
            _atomicAdd(dst + ty * image_stride + tx, value * weight);
            _atomicAdd(normalization_factor + ty * image_stride + tx, weight);
        }

        if (shift == 2) {
            tx += 1; // Adjust tx for next iteration after upper-left corner adjustment
        }
    }
}