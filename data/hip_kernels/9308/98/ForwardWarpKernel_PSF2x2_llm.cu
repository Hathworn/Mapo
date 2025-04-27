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

    // Precompute common expressions
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;
    float px, py, dx, dy;
    dx = modff(cx, &px);
    dy = modff(cy, &py);

    // Precalculate coordinates and weights
    int tx = (int)px;
    int ty = (int)py;
    float value = src[image_row_offset + j];
    float weights[4] = {dx * dy, (1.0f - dx) * dy, (1.0f - dx) * (1.0f - dy), dx * (1.0f - dy)};
    int coords[4][2] = {{tx, ty}, {tx - 1, ty}, {tx - 1, ty - 1}, {tx, ty - 1}};
    
    // Loop unrolling for improved performance
    #pragma unroll
    for (int k = 0; k < 4; ++k) {
        int x = coords[k][0];
        int y = coords[k][1];
        if (!(x >= w || x < 0 || y >= h || y < 0)) {
            _atomicAdd(dst + y * image_stride + x, value * weights[k]);
            _atomicAdd(normalization_factor + y * image_stride + x, weights[k]);
        }
    }
}