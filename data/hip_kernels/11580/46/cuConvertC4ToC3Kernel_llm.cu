#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuConvertC4ToC3Kernel(const float4* __restrict__ src, size_t src_stride, float3* __restrict__ dst, size_t dst_stride, int width, int height)
{
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Pre-calculate indices to reduce repetitive calculations
    if (x < width && y < height)
    {
        int src_c = y * src_stride + x;
        int dst_c = y * dst_stride + x;

        // Load float4 once to improve memory coalescing and reduce read transactions
        float4 val = src[src_c];
        dst[dst_c] = make_float3(val.x, val.y, val.z);
    }
}