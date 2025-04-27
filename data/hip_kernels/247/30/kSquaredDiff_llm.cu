#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSquaredDiff(float* a, float* b, float* dest, unsigned int numEls) {
    // Optimize thread index calculation
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int stride = blockDim.x * gridDim.x;

    // Unroll the loop to reduce the number of iterations
    for (; i + 6 < numEls; i += 7 * stride) {
        dest[i] = (a[i] - b[i]) * (a[i] - b[i]);
        dest[i + stride] = (a[i + stride] - b[i + stride]) * (a[i + stride] - b[i + stride]);
        dest[i + 2 * stride] = (a[i + 2 * stride] - b[i + 2 * stride]) * (a[i + 2 * stride] - b[i + 2 * stride]);
        dest[i + 3 * stride] = (a[i + 3 * stride] - b[i + 3 * stride]) * (a[i + 3 * stride] - b[i + 3 * stride]);
        dest[i + 4 * stride] = (a[i + 4 * stride] - b[i + 4 * stride]) * (a[i + 4 * stride] - b[i + 4 * stride]);
        dest[i + 5 * stride] = (a[i + 5 * stride] - b[i + 5 * stride]) * (a[i + 5 * stride] - b[i + 5 * stride]);
        dest[i + 6 * stride] = (a[i + 6 * stride] - b[i + 6 * stride]) * (a[i + 6 * stride] - b[i + 6 * stride]);
    }

    // Handle remaining elements
    for (; i < numEls; i += stride) {
        dest[i] = (a[i] - b[i]) * (a[i] - b[i]);
    }
}