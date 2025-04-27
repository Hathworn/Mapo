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

    // Compute target pixel coordinates
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;

    // Extract integer part and fractional part
    float px, py;
    float dx = modff(cx, &px);
    float dy = modff(cy, &py);

    // Cast integer coordinates
    int tx = (int)px;
    int ty = (int)py;

    // Fetch source pixel value
    float value = src[image_row_offset + j];

    // Precompute weights for different pixels
    float wbr = dx * dy;
    float wbl = (1.0f - dx) * dy;
    float wul = (1.0f - dx) * (1.0f - dy);
    float wur = dx * (1.0f - dy);
    
    // Macro to perform atomic add if within bounds
    #define ATOMIC_ADD_CONDITIONALLY(tx, ty, weight) \
    if (!((tx >= w) || (tx < 0) || (ty >= h) || (ty < 0))) { \
        _atomicAdd(dst + ty * image_stride + tx, value * weight); \
        _atomicAdd(normalization_factor + ty * image_stride + tx, weight); \
    }

    // Apply precomputed weights to relevant pixels
    ATOMIC_ADD_CONDITIONALLY(tx, ty, wbr); // Bottom right
    ATOMIC_ADD_CONDITIONALLY(tx - 1, ty, wbl); // Bottom left
    ATOMIC_ADD_CONDITIONALLY(tx - 1, ty - 1, wul); // Upper left
    ATOMIC_ADD_CONDITIONALLY(tx, ty - 1, wur); // Upper right

    #undef ATOMIC_ADD_CONDITIONALLY
}