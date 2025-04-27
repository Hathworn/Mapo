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

    // Compute bottom left corner of a target pixel
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;
    float px, py;
    float dx = modff(cx, &px);
    float dy = modff(cy, &py);

    // Target pixel integer coords
    int tx = (int) px;
    int ty = (int) py;

    float value = src[image_row_offset + j];
    float weight;

    // Define a lambda function to reduce repetitive calculations
    auto accumulate = [&](int tx, int ty, float dx_weight, float dy_weight) {
        if (!(tx >= w || tx < 0 || ty >= h || ty < 0)) {
            weight = dx_weight * dy_weight;
            atomicAdd(dst + ty * image_stride + tx, value * weight);
            atomicAdd(normalization_factor + ty * image_stride + tx, weight);
        }
    };

    // Fill pixel containing bottom right corner
    accumulate(tx, ty, dx, dy);

    // Fill pixel containing bottom left corner
    accumulate(tx - 1, ty, 1.0f - dx, dy);

    // Fill pixel containing upper left corner
    accumulate(tx - 1, ty - 1, 1.0f - dx, 1.0f - dy);

    // Fill pixel containing upper right corner
    accumulate(tx, ty - 1, dx, 1.0f - dy);
}