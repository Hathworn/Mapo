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

    // calculate target pixel position
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;
    float px, py, dx, dy;
    dx = modff(cx, &px);
    dy = modff(cy, &py);

    int tx = (int)px, ty = (int)py;
    float value = src[image_row_offset + j];
    float weight;

    // optimize bounds checking by consolidating conditionals
    if (ty >= 0 && ty < h) {
        if (tx >= 0 && tx < w) {
            weight = dx * dy;
            _atomicAdd(dst + ty * image_stride + tx, value * weight);
            _atomicAdd(normalization_factor + ty * image_stride + tx, weight);
        }
        if (tx - 1 >= 0) {
            weight = (1.0f - dx) * dy;
            _atomicAdd(dst + ty * image_stride + (tx - 1), value * weight);
            _atomicAdd(normalization_factor + ty * image_stride + (tx - 1), weight);
        }
    }
    if (ty - 1 >= 0 && ty - 1 < h) {
        if (tx - 1 >= 0) {
            weight = (1.0f - dx) * (1.0f - dy);
            _atomicAdd(dst + (ty - 1) * image_stride + (tx - 1), value * weight);
            _atomicAdd(normalization_factor + (ty - 1) * image_stride + (tx - 1), weight);
        }
        if (tx >= 0 && tx < w) {
            weight = dx * (1.0f - dy);
            _atomicAdd(dst + (ty - 1) * image_stride + tx, value * weight);
            _atomicAdd(normalization_factor + (ty - 1) * image_stride + tx, weight);
        }
    }
}