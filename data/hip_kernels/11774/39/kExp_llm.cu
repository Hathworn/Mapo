#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kExp(float* __restrict__ mat, float* __restrict__ target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Optimize memory access pattern and reduce register pressure
    for (unsigned int i = idx; i < len; i += stride) {
        target[i] = __expf(mat[i]);
    }
}