#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void ForwardWarpKernel_PSF1x1(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *dst)
{
    // Calculate global thread indices for x and y directions
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    // Ensure the thread is within bounds
    if (i >= h || j >= w) return;

    // Pre-compute row offsets for efficiency
    int flow_row_offset = i * flow_stride;
    int image_row_offset = i * image_stride;

    // Read flow data
    float u_ = u[flow_row_offset + j];
    float v_ = v[flow_row_offset + j];

    // Compute target coordinates
    // Simplify corner calculations by using implicit casting
    float cx = u_ * time_scale + j + 1.0f;
    float cy = v_ * time_scale + i + 1.0f;
    
    // Calculate rounded target pixel location
    int tx = __float2int_rn(cx);
    int ty = __float2int_rn(cy);

    // Read from source image
    float value = src[image_row_offset + j];

    // Atomic addition to avoid race conditions in updating dst
    // Check if the target pixel is within valid bounds
    if (tx >= 0 && tx < w && ty >= 0 && ty < h)
    {
        atomicAdd(dst + ty * image_stride + tx, value);
    }
}