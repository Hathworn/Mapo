#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void ForwardWarpKernel_PSF1x1(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *dst)
{
    // Calculate row and column indices for the current thread
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    // Return if the thread is outside the image bounds
    if (i >= h || j >= w) return;

    // Pre-calculate offsets for flow and image arrays
    int flow_row_offset = i * flow_stride;
    int image_row_offset = i * image_stride;

    // Fetch flow values from global memory
    float u_ = u[flow_row_offset + j];
    float v_ = v[flow_row_offset + j];

    // Calculate the bottom left corner of the target pixel using flow displacement
    float cx = u_ * time_scale + (float)j + 1.0f;
    float cy = v_ * time_scale + (float)i + 1.0f;

    // Determine pixel coordinates for the target location
    int tx = __float2int_rn(cx);
    int ty = __float2int_rn(cy);

    // Fast path to check if target pixel is within bounds
    if (tx >= 0 && tx < w && ty >= 0 && ty < h)
    {
        float value = src[image_row_offset + j];

        // Atomically add the value to the target pixel in destination image
        atomicAdd(dst + ty * image_stride + tx, value);
    }
}