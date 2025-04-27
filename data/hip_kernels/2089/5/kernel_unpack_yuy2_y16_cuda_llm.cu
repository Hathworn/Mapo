#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_unpack_yuy2_y16_cuda(const uint8_t * src, uint8_t *dst, int superPixCount)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Use loop unrolling to improve performance
    int idx;
    for (; i + 4 < superPixCount; i += stride * 4) {
        idx = i * 4;
        dst[idx] = 0;
        dst[idx + 1] = src[idx];
        dst[idx + 2] = 0;
        dst[idx + 3] = src[idx + 2];

        idx += stride * 4;
        dst[idx] = 0;
        dst[idx + 1] = src[idx];
        dst[idx + 2] = 0;
        dst[idx + 3] = src[idx + 2];

        idx += stride * 4;
        dst[idx] = 0;
        dst[idx + 1] = src[idx];
        dst[idx + 2] = 0;
        dst[idx + 3] = src[idx + 2];

        idx += stride * 4;
        dst[idx] = 0;
        dst[idx + 1] = src[idx];
        dst[idx + 2] = 0;
        dst[idx + 3] = src[idx + 2];
    }

    // Handle remaining iterations
    for (; i < superPixCount; i += stride) {
        idx = i * 4;
        dst[idx] = 0;
        dst[idx + 1] = src[idx];
        dst[idx + 2] = 0;
        dst[idx + 3] = src[idx + 2];
    }
}