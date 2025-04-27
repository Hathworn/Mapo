#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_unpack_yuy2_bgra8_cuda(const uint8_t * src, uint8_t *dst, int superPixCount)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Ensure threads do not operate outside the bounds
    for (; i < superPixCount; i += stride) {
        int idx = i * 4;
        uint8_t y0 = src[idx];
        uint8_t u0 = src[idx + 1];
        uint8_t y1 = src[idx + 2];
        uint8_t v0 = src[idx + 3];

        // Precompute common constants
        int16_t d = u0 - 128;
        int16_t e = v0 - 128;
        
        // Use the inline function to avoid macro overhead
        auto clamp = [&](int x) { return (x > 255) ? 255 : (x < 0) ? 0 : x; };

        int odx = i * 8;

        // Compute common factors outside clamp function
        int16_t c0 = y0 - 16;
        dst[odx + 3] = 255;
        dst[odx + 2] = clamp((298 * c0 + 409 * e + 128) >> 8);
        dst[odx + 1] = clamp((298 * c0 - 100 * d - 409 * e + 128) >> 8);
        dst[odx] = clamp((298 * c0 + 516 * d + 128) >> 8);

        int16_t c1 = y1 - 16;
        dst[odx + 7] = 255;
        dst[odx + 6] = clamp((298 * c1 + 409 * e + 128) >> 8);
        dst[odx + 5] = clamp((298 * c1 - 100 * d - 409 * e + 128) >> 8);
        dst[odx + 4] = clamp((298 * c1 + 516 * d + 128) >> 8);
    }
}