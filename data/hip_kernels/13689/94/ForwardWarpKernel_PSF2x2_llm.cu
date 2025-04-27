#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void ForwardWarpKernel_PSF2x2(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *normalization_factor, float *dst)
{
    // Calculate the global x and y index for the thread
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    // Return early if out of bounds
    if (i >= h || j >= w) return;

    int flow_row_offset  = i * flow_stride;
    int image_row_offset = i * image_stride;

    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;

    float px, py;
    float dx = modff(cx, &px);
    float dy = modff(cy, &py);

    int tx = (int) px;
    int ty = (int) py;

    float value = src[image_row_offset + j];
    float weight;

    // Precompute weights
    float w00 = (1.0f - dx) * (1.0f - dy);
    float w01 = dx * (1.0f - dy);
    float w10 = (1.0f - dx) * dy;
    float w11 = dx * dy;

    // Fill pixel containing bottom right corner
    if (tx < w && tx >= 0 && ty < h && ty >= 0)
    {
        weight = w11;
        atomicAdd(&dst[ty * image_stride + tx], value * weight);
        atomicAdd(&normalization_factor[ty * image_stride + tx], weight);
    }

    // Fill pixel containing bottom left corner
    if (tx - 1 < w && tx - 1 >= 0 && ty < h && ty >= 0)
    {
        weight = w10;
        atomicAdd(&dst[ty * image_stride + (tx - 1)], value * weight);
        atomicAdd(&normalization_factor[ty * image_stride + (tx - 1)], weight);
    }

    // Fill pixel containing upper left corner
    if (tx - 1 < w && tx - 1 >= 0 && ty - 1 < h && ty - 1 >= 0)
    {
        weight = w00;
        atomicAdd(&dst[(ty - 1) * image_stride + (tx - 1)], value * weight);
        atomicAdd(&normalization_factor[(ty - 1) * image_stride + (tx - 1)], weight);
    }

    // Fill pixel containing upper right corner
    if (tx < w && tx >= 0 && ty - 1 < h && ty - 1 >= 0)
    {
        weight = w01;
        atomicAdd(&dst[(ty - 1) * image_stride + tx], value * weight);
        atomicAdd(&normalization_factor[(ty - 1) * image_stride + tx], weight);
    }
}