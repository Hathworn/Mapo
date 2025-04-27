#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_unpack_yuy2_bgr8_cuda(const uint8_t * src, uint8_t *dst, int superPixCount)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    int t;

    // Moved calculations outside of the loop for better performance.
    for (; i < superPixCount; i += stride) 
    {
        int idx = i * 4;

        uint8_t y0 = src[idx];
        uint8_t u0 = src[idx + 1];
        uint8_t y1 = src[idx + 2];
        uint8_t v0 = src[idx + 3];

        int16_t c0 = y0 - 16;
        int16_t c1 = y1 - 16;
        int16_t d = u0 - 128;
        int16_t e = v0 - 128;

        int odx = i * 6;

        // Precompute common expressions
        int32_t d_c = 516 * d + 128;
        int32_t e_c = 409 * e + 128;
        int32_t de_c = -100 * d - 409 * e + 128;

        #define clamp(x)  ((t=(x)) > 255 ? 255 : t < 0 ? 0 : t)

        dst[odx + 2] = clamp((298 * c0 + e_c) >> 8);
        dst[odx + 1] = clamp((298 * c0 + de_c) >> 8);
        dst[odx] = clamp((298 * c0 + d_c) >> 8);

        dst[odx + 5] = clamp((298 * c1 + e_c) >> 8);
        dst[odx + 4] = clamp((298 * c1 + de_c) >> 8);
        dst[odx + 3] = clamp((298 * c1 + d_c) >> 8);

        #undef clamp
    }
}