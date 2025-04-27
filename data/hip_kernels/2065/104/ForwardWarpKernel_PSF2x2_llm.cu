#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val) {
    return val.y;
}

__global__ void ForwardWarpKernel_PSF2x2(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *normalization_factor, float *dst) {
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    if (i >= h || j >= w) return;

    int flow_row_offset = i * flow_stride;
    int image_row_offset = i * image_stride;

    // Precompute common expressions
    float value = src[image_row_offset + j];
    float cx = u[flow_row_offset + j] * time_scale + static_cast<float>(j) + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + static_cast<float>(i) + 1.0f;

    float px, py, dx = modff(cx, &px), dy = modff(cy, &py);

    int base_tx = static_cast<int>(px), base_ty = static_cast<int>(py);

    // Helper lambda for updating pixel
    auto update_pixel = [&](int tx, int ty, float w) {
        if (tx >= 0 && tx < w && ty >= 0 && ty < h) {
            int offset = ty * image_stride + tx;
            atomicAdd(dst + offset, value * w); // Use HIP atomic functions
            atomicAdd(normalization_factor + offset, w);
        }
    };

    // Fill four corners
    update_pixel(base_tx, base_ty, dx * dy);
    update_pixel(base_tx - 1, base_ty, (1.0f - dx) * dy);
    update_pixel(base_tx - 1, base_ty - 1, (1.0f - dx) * (1.0f - dy));
    update_pixel(base_tx, base_ty - 1, dx * (1.0f - dy));
}