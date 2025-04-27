#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuConvert8uC1To32fC1Kernel(const unsigned char *src, size_t src_stride, float* dst, size_t dst_stride, float mul_constant, float add_constant, int width, int height)
{
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Combine index calculation into a single operation to reduce instruction count
    size_t src_c = static_cast<size_t>(y) * src_stride + x;
    size_t dst_c = static_cast<size_t>(y) * dst_stride + x;

    // Check bounds before performing operation to avoid out-of-bounds access
    if (x < width && y < height) {
        dst[dst_c] = static_cast<float>(src[src_c]) * mul_constant + add_constant;
    }
}