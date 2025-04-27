#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function to compute log(1 + exp(x)) for each element in the input array
__global__ void kApplyLog1PlusExp(float* mat, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;
    float mat_i;

    for (unsigned int i = idx; i < len; i += numThreads) {
        mat_i = mat[i];
        // Use math function directly to simplify conditional expression
        target[i] = mat_i > 0 ? (__logf(1 + __expf(-mat_i)) + mat_i) : __logf(1 + __expf(mat_i));
    }
}