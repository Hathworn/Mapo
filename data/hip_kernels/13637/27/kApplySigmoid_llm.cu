#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kApplySigmoid(float* mat, float* target, unsigned int len) {
    // Use grid-stride loop to ensure all elements are processed
    for (unsigned int i = blockIdx.x * blockDim.x + threadIdx.x; i < len; i += blockDim.x * gridDim.x) {
        target[i] = 1 / (1 + __expf(-mat[i]));
    }
}