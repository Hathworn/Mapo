#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void ForwardWarpKernel_PSF2x2(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *normalization_factor, float *dst)
{
    // Compute global thread indices
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    // Boundary guard
    if (i >= h || j >= w) return;

    int flow_row_offset  = i * flow_stride;
    int image_row_offset = i * image_stride;

    // Calculate the mapping with offset for the flow
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;

    float px, py;
    float dx = modff(cx, &px);
    float dy = modff(cy, &py);
    int tx = (int)px;
    int ty = (int)py;
    float value = src[image_row_offset + j];
    float weight;

    // Macro for pixel contribution calculation
    #define ADD_TO_DEST(tx, ty, dx_factor, dy_factor)                \
        if (!((tx >= w) || (tx < 0) || (ty >= h) || (ty < 0))) {     \
            weight = dx_factor * dy_factor;                          \
            atomicAdd(dst + ty * image_stride + tx, value * weight); \
            atomicAdd(normalization_factor + ty * image_stride + tx, weight); \
        }

    // Calculate contributions to each of the target pixels
    ADD_TO_DEST(tx, ty, dx, dy)              // Bottom right
    ADD_TO_DEST(tx - 1, ty, (1.0f - dx), dy) // Bottom left
    ADD_TO_DEST(tx - 1, ty - 1, (1.0f - dx), (1.0f - dy)) // Upper left
    ADD_TO_DEST(tx, ty - 1, dx, (1.0f - dy)) // Upper right

    #undef ADD_TO_DEST
}