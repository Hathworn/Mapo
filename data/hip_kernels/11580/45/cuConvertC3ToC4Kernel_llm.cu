#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuConvertC3ToC4Kernel(const float3* src, size_t src_stride, float4* dst, size_t dst_stride, int width, int height)
{
    // Calculate the linear index instead of separate x and y
    int idx = blockIdx.y * blockDim.y * src_stride + blockIdx.x * blockDim.x + threadIdx.y * src_stride + threadIdx.x;

    // Ensure index is within bounds
    if (threadIdx.x + blockIdx.x * blockDim.x < width && threadIdx.y + blockIdx.y * blockDim.y < height)
    {
        float3 val = src[idx];
        dst[idx] = make_float4(val.x, val.y, val.z, 1.0f);
    }
}