#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_unpack_yuy2_y16_cuda(const uint8_t *src, uint8_t *dst, int superPixCount)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Unroll loop by processing multiple elements per thread to utilize memory coalescing
    int idx = i * 4; // Pre-calculate index for better performance
    if (i < superPixCount)
    {
        dst[idx] = 0;
        dst[idx + 1] = src[idx + 0];
        dst[idx + 2] = 0;
        dst[idx + 3] = src[idx + 2];
    }
}