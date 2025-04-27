```c
#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ uint8_t clamp(int32_t x) {
    return x > 255 ? 255 : x < 0 ? 0 : x;
}

__global__ void kernel_unpack_yuy2_rgba8_cuda(const uint8_t *src, uint8_t *dst, int superPixCount) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    if (i < superPixCount) {
        int maxIndex = (superPixCount + stride - 1) / stride * stride;
        
        for (; i < maxIndex; i += stride) {
            if (i >= superPixCount) break;  // Prevent out-of-bound access

            int idx = i * 4;
            uint8_t y0 = src[idx];
            uint8_t u0 = src[idx + 1];
            uint8_t y1 = src[idx + 2];
            uint8_t v0 = src[idx + 3];

            int16_t c = y0 - 16;
            int16_t d = u0 - 128;
            int16_t e = v0 - 128;

            int odx = i * 8;

            dst[odx] = clamp((298 * c + 409 * e + 128) >> 8);
            dst[odx + 1] = clamp((298 * c - 100 * d - 409 * e + 128) >> 8);
            dst[odx + 2] = clamp((298 * c + 516 * d + 128) >> 8);
            dst[odx + 3] = 255;

            c = y1 - 16;

            dst[odx + 4] = clamp((298 * c + 409 * e + 128) >> 8);
            dst[odx + 5] = clamp((298 * c - 100 * d - 409 * e + 128) >> 8);
            dst[odx + 6] = clamp((298 * c + 516 * d + 128) >> 8);
            dst[odx + 7] = 255;
        }
    }
}