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

    // Precompute variables to avoid redundant calculations
    float cx = u[flow_row_offset + j] * time_scale + static_cast<float>(j) + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + static_cast<float>(i) + 1.0f;

    float px, py;
    float dx = modff(cx, &px);
    float dy = modff(cy, &py);
    
    // Target pixel integer coordinates
    int tx = static_cast<int>(px);
    int ty = static_cast<int>(py);
    float value = src[image_row_offset + j];

    // Combine conditions to reduce code duplication and improve readability
    for (int x_offset = 0; x_offset <= 1; ++x_offset) {
        for (int y_offset = 0; y_offset <= 1; ++y_offset) {
            int tx_offset = tx - x_offset;
            int ty_offset = ty - y_offset;
            if (tx_offset >= 0 && tx_offset < w && ty_offset >= 0 && ty_offset < h) {
                float weight = ((x_offset == 0) ? (1.0f - dx) : dx) * ((y_offset == 0) ? (1.0f - dy) : dy);
                atomicAdd(dst + ty_offset * image_stride + tx_offset, value * weight);
                atomicAdd(normalization_factor + ty_offset * image_stride + tx_offset, weight);
            }
        }
    }
}
```
