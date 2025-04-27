#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_unpack_yuy2_bgr8_cuda(const uint8_t * src, uint8_t *dst, int superPixCount)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Use shared memory to reduce memory access latency
    extern __shared__ uint8_t shared_src[];

    if (i < superPixCount) {
        int idx = i * 4;

        // Load input data into shared memory
        shared_src[threadIdx.x * 4] = src[idx];
        shared_src[threadIdx.x * 4 + 1] = src[idx + 1];
        shared_src[threadIdx.x * 4 + 2] = src[idx + 2];
        shared_src[threadIdx.x * 4 + 3] = src[idx + 3];
        __syncthreads(); // Synchronize threads within the block

        uint8_t y0 = shared_src[threadIdx.x * 4];
        uint8_t u0 = shared_src[threadIdx.x * 4 + 1];
        uint8_t y1 = shared_src[threadIdx.x * 4 + 2];
        uint8_t v0 = shared_src[threadIdx.x * 4 + 3];

        int16_t c = y0 - 16;
        int16_t d = u0 - 128;
        int16_t e = v0 - 128;

        int32_t t;
        #define clamp(x)  ((t=(x)) > 255 ? 255 : t < 0 ? 0 : t)

        int odx = i * 6;

        dst[odx + 2] = clamp((298 * c + 409 * e + 128) >> 8);
        dst[odx + 1] = clamp((298 * c - 100 * d - 409 * e + 128) >> 8);
        dst[odx] = clamp((298 * c + 516 * d + 128) >> 8);

        c = y1 - 16;

        dst[odx + 5] = clamp((298 * c + 409 * e + 128) >> 8);
        dst[odx + 4] = clamp((298 * c - 100 * d - 409 * e + 128) >> 8);
        dst[odx + 3] = clamp((298 * c + 516 * d + 128) >> 8);

        #undef clamp
    }
}