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

    // Early exit if out of bounds
    if (i >= h || j >= w) return;

    int flow_row_offset  = i * flow_stride;
    int image_row_offset = i * image_stride;

    // Calculate bottom left corner of a target pixel using flow
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;

    // Fractional and integral decomposition
    float px, py;
    float dx = modff (cx, &px);
    float dy = modff (cy, &py);

    // Target pixel coordinates
    int tx = (int) px;
    int ty = (int) py;

    float value = src[image_row_offset + j];
    float weight;

    // Utilize inline function for atomic add
    auto atomic_add_wrapper = [](float* address, float value) {
        atomicAdd(address, value);
    };

    // Avoid repeated calculations for checks
    auto addToPixel = [&](int x, int y, float weight_val) {
        if ((x >= 0) && (x < w) && (y >= 0) && (y < h)) {
            atomic_add_wrapper(dst + y * image_stride + x, value * weight_val);
            atomic_add_wrapper(normalization_factor + y * image_stride + x, weight_val);
        }
    };

    // Fill pixels based on barycentric coordinates
    addToPixel(tx, ty, dx * dy);
    tx -= 1;
    addToPixel(tx, ty, (1.0f - dx) * dy);
    ty -= 1;
    addToPixel(tx, ty, (1.0f - dx) * (1.0f - dy));
    tx += 1;
    addToPixel(tx, ty, dx * (1.0f - dy));
}