```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kApplyLog1PlusExp(float* mat, float* target, unsigned int len) {
    // Calculate the global index and number of threads
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Simplify by leveraging __expf and __logf directly
    for (unsigned int i = idx; i < len; i += numThreads) {
        float mat_i = mat[i];
        target[i] = mat_i > 0 ? (__logf(1 + __expf(-mat_i)) + mat_i) : __logf(1 + __expf(mat_i));
    }
}