#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kApplyLog1PlusExpExact(float* mat, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;
    float mat_i;

    // Loop unrolling for better performance
    for (unsigned int i = idx; i < len; i += numThreads * 4) {
        if (i < len) {
            mat_i = mat[i];
            target[i] = (mat_i > 0) ? (log(1 + exp(-mat_i)) + mat_i) : log(1 + exp(mat_i));
        }
        if (i + numThreads < len) {
            mat_i = mat[i + numThreads];
            target[i + numThreads] = (mat_i > 0) ? (log(1 + exp(-mat_i)) + mat_i) : log(1 + exp(mat_i));
        }
        if (i + 2*numThreads < len) {
            mat_i = mat[i + 2*numThreads];
            target[i + 2*numThreads] = (mat_i > 0) ? (log(1 + exp(-mat_i)) + mat_i) : log(1 + exp(mat_i));
        }
        if (i + 3*numThreads < len) {
            mat_i = mat[i + 3*numThreads];
            target[i + 3*numThreads] = (mat_i > 0) ? (log(1 + exp(-mat_i)) + mat_i) : log(1 + exp(mat_i));
        }
    }
}