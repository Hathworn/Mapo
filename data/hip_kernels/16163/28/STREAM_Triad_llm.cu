#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Triad(float *a, float *b, float *c, float scalar, size_t len)
{
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    size_t stride = blockDim.x * gridDim.x;

    // Unroll the loop for optimization
    for (; idx + 3 < len; idx += 4 * stride) {
        c[idx] = a[idx] + scalar * b[idx];
        c[idx + stride] = a[idx + stride] + scalar * b[idx + stride];
        c[idx + 2 * stride] = a[idx + 2 * stride] + scalar * b[idx + 2 * stride];
        c[idx + 3 * stride] = a[idx + 3 * stride] + scalar * b[idx + 3 * stride];
    }

    // Handle remaining elements
    for (; idx < len; idx += stride) {
        c[idx] = a[idx] + scalar * b[idx];
    }
}