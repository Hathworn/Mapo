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

    // Calculate coordinates and weight once, reuse them
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;
    float px, py;
    float dx = modff(cx, &px);
    float dy = modff(cy, &py);

    int tx = (int) px;
    int ty = (int) py;
    float value = src[image_row_offset + j];

    #pragma unroll 4 // Unroll the following 4 operations for better performance
    for (int k = 0; k < 4; ++k) {
        // Check bounds and calculate weight
        if (!((tx >= w) || (tx < 0) || (ty >= h) || (ty < 0))) {
            float weight = ((k & 1) ? dx : (1.0f - dx)) * ((k & 2) ? dy : (1.0f - dy));
            _atomicAdd(dst + ty * image_stride + tx, value * weight);
            _atomicAdd(normalization_factor + ty * image_stride + tx, weight);
        }
        // Update coordinates for next corner
        tx += (k == 0) - (k == 1);
        ty += (k == 2) - (k == 3);
    }
}