#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kEqualsScalar(float* mat, float val, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Use cache and check boundary condition
    for (unsigned int i = idx; i < len; i += stride) {
        target[i] = mat[i] == val;
    }
}