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

    // Ensure within bounds
    if (i >= h || j >= w) return;

    int flow_row_offset  = i * flow_stride;
    int image_row_offset = i * image_stride;

    // Compute target coordinates and offsets
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;
    float px, py;
    float dx = modff (cx, &px);
    float dy = modff (cy, &py);

    // integer coords for target pixel
    int tx = static_cast<int>(px);
    int ty = static_cast<int>(py);
    float value = src[image_row_offset + j];
    float weight;
    
    // Function to conditionally add weight and value
    auto conditionalAdd = [&](int x, int y, float w) {
        if (!(x >= w || x < 0 || y >= h || y < 0)) {
            _atomicAdd(dst + y * image_stride + x, value * w);
            _atomicAdd(normalization_factor + y * image_stride + x, w);
        }
    };
    
    // Fill pixels with calculated weights
    weight = dx * dy;
    conditionalAdd(tx, ty, weight);

    tx -= 1;
    weight = (1.0f - dx) * dy;
    conditionalAdd(tx, ty, weight);

    ty -= 1;
    weight = (1.0f - dx) * (1.0f - dy);
    conditionalAdd(tx, ty, weight);

    tx += 1;
    weight = dx * (1.0f - dy);
    conditionalAdd(tx, ty, weight);
}