#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSign(float* mat, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Loop over the data with stride of number of threads
    for (unsigned int i = idx; i < len; i += numThreads) {
        // Use ternary operator to directly assign the sign
        target[i] = (mat[i] > 0) - (mat[i] < 0);
    }
}