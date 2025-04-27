#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_unpack_yuy2_rgba8_cuda(const uint8_t * src, uint8_t *dst, int superPixCount)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    if (i < superPixCount) {  // Check bounds early to avoid unnecessary checks in the loop
        for (; i < superPixCount; i += stride) {

            int idx = i * 4;

            uint8_t y0 = src[idx];
            uint8_t u0 = src[idx + 1];
            uint8_t y1 = src[idx + 2];
            uint8_t v0 = src[idx + 3];

            int16_t c0 = y0 - 16;
            int16_t c1 = y1 - 16;
            int16_t d = u0 - 128;
            int16_t e = v0 - 128;

            int32_t t;
            #define clamp(x)  ((t=(x)) > 255 ? 255 : t < 0 ? 0 : t)

            int odx = i * 8;

            // Calculate common values once to reduce repeated operations
            int32_t redFactor = 298 * c0 + 409 * e + 128;
            int32_t greenFactor = 298 * c0 - 100 * d - 409 * e + 128;
            int32_t blueFactor = 298 * c0 + 516 * d + 128;

            dst[odx] = clamp(redFactor >> 8);
            dst[odx + 1] = clamp(greenFactor >> 8);
            dst[odx + 2] = clamp(blueFactor >> 8);
            dst[odx + 3] = 255;

            redFactor = 298 * c1 + 409 * e + 128;
            greenFactor = 298 * c1 - 100 * d - 409 * e + 128;
            blueFactor = 298 * c1 + 516 * d + 128;

            dst[odx + 4] = clamp(redFactor >> 8);
            dst[odx + 5] = clamp(greenFactor >> 8);
            dst[odx + 6] = clamp(blueFactor >> 8);
            dst[odx + 7] = 255;

            #undef clamp
        }
    }
}