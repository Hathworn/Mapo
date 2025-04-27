#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kApplyTanh(float* mat, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Loop unrolling for better performance
    for (unsigned int i = idx; i < len; i += numThreads * 4) {
        if (i < len) {
            float mat_i = mat[i];
            float exp2x = __expf(2 * mat_i);
            target[i] = 1 - 2 / (exp2x + 1);
        }
        if (i + numThreads < len) {
            float mat_i1 = mat[i + numThreads];
            float exp2x1 = __expf(2 * mat_i1);
            target[i + numThreads] = 1 - 2 / (exp2x1 + 1);
        }
        if (i + 2 * numThreads < len) {
            float mat_i2 = mat[i + 2 * numThreads];
            float exp2x2 = __expf(2 * mat_i2);
            target[i + 2 * numThreads] = 1 - 2 / (exp2x2 + 1);
        }
        if (i + 3 * numThreads < len) {
            float mat_i3 = mat[i + 3 * numThreads];
            float exp2x3 = __expf(2 * mat_i3);
            target[i + 3 * numThreads] = 1 - 2 / (exp2x3 + 1);
        }
    }
}