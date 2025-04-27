#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void ForwardWarpKernel_PSF2x2(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *normalization_factor, float *dst)
{
    // Calculate pixel coordinates
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    if (i >= h || j >= w) return; // Early return if out-of-bounds

    int flow_row_offset = i * flow_stride;
    int image_row_offset = i * image_stride;

    // Calculate position with offset and scaling
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;

    // Decompose into integer coordinates and fractional offsets
    float px, py;
    float dx = modff(cx, &px);
    float dy = modff(cy, &py);

    int tx = (int) px;
    int ty = (int) py;

    float value = src[image_row_offset + j];

    // Macro to avoid repetitive bounds checking and operations
    #define UPDATE_PIXEL(off_tx, off_ty, weight_factor) \
    { \
        int final_tx = tx + (off_tx); \
        int final_ty = ty + (off_ty); \
        if (final_tx >= 0 && final_tx < w && final_ty >= 0 && final_ty < h) \
        { \
            float weight = weight_factor; \
            _atomicAdd(dst + final_ty * image_stride + final_tx, value * weight); \
            _atomicAdd(normalization_factor + final_ty * image_stride + final_tx, weight); \
        } \
    }

    // Update the pixels at the four corners with appropriate weights
    UPDATE_PIXEL(0, 0, dx * dy);              // Bottom-right
    UPDATE_PIXEL(-1, 0, (1.0f - dx) * dy);    // Bottom-left
    UPDATE_PIXEL(-1, -1, (1.0f - dx) * (1.0f - dy)); // Upper-left
    UPDATE_PIXEL(0, -1, dx * (1.0f - dy));    // Upper-right

    #undef UPDATE_PIXEL
}