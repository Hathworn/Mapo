#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kPowMatrix(float* mat, float* pow, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride loop to effectively utilize all threads
    for (unsigned int i = idx; i < len; i += blockDim.x * gridDim.x) {
        target[i] = powf(mat[i], pow[i]);
    }
}