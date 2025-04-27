#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kExp(float* mat, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a more efficient loop by checking idx directly.
    if (idx < len) {
        target[idx] = __expf(mat[idx]);
    }
}