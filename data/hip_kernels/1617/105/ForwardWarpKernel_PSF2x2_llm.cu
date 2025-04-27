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

    // Precompute scaled flow values
    float scaled_u = u[flow_row_offset + j] * time_scale;
    float scaled_v = v[flow_row_offset + j] * time_scale;
    
    // Compute pixel coordinates directly
    float cx = scaled_u + (float)j + 1.0f;
    float cy = scaled_v + (float)i + 1.0f;

    float px, py, dx, dy;
    dx = modff(cx, &px);
    dy = modff(cy, &py);

    // Calculate value once
    float value = src[image_row_offset + j];
    
    int tx = (int) px;
    int ty = (int) py;
    
    float weight;

    // Using a helper lambda for bounds check and atomic operations
    auto atomicAddSafe = [&] (int x, int y, float val, float wt) {
        if (!(x >= w || x < 0 || y >= h || y < 0)) {
            _atomicAdd(dst + y * image_stride + x, val * wt);
            _atomicAdd(normalization_factor + y * image_stride + x, wt);
        }
    };
    
    // Fill pixel containing bottom right corner
    weight = dx * dy;
    atomicAddSafe(tx, ty, value, weight);

    // Fill pixel containing bottom left corner
    tx -= 1;
    weight = (1.0f - dx) * dy;
    atomicAddSafe(tx, ty, value, weight);
    
    // Fill pixel containing upper left corner
    ty -= 1;
    weight = (1.0f - dx) * (1.0f - dy);
    atomicAddSafe(tx, ty, value, weight);
    
    // Fill pixel containing upper right corner
    tx += 1;
    weight = dx * (1.0f - dy);
    atomicAddSafe(tx, ty, value, weight);
}