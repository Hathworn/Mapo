```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_unpack_yuy2_rgb8_cuda(const uint8_t * src, uint8_t *dst, int superPixCount)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i < superPixCount) {
        int idx = i * 4;

        uint8_t y0 = src[idx];
        uint8_t u0 = src[idx + 1];
        uint8_t y1 = src[idx + 2];
        uint8_t v0 = src[idx + 3];

        int16_t c = y0 - 16;
        int16_t d = u0 - 128;
        int16_t e = v0 - 128;

        int t;
        #define clamp(x)  ((t=(x)) > 255 ? 255 : t < 0 ? 0 : t)

        int odx = i * 6;

        // Precompute common expressions to optimize performance
        int c298 = 298 * c;
        int e409 = 409 * e + 128;
        
        dst[odx] = clamp((c298 +  e409) >> 8);
        dst[odx + 1] = clamp((c298 - 100 * d - e409) >> 8);
        dst[odx + 2] = clamp((c298 + 516 * d + 128) >> 8);

        c = y1 - 16;
        c298 = 298 * c;

        dst[odx + 3] = clamp((c298 + e409) >> 8);
        dst[odx + 4] = clamp((c298 - 100 * d - e409) >> 8);
        dst[odx + 5] = clamp((c298 + 516 * d + 128) >> 8);

        #undef clamp
    }
}