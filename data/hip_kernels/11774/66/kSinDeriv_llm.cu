#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSinDeriv(float* a, float* b, float* dest, unsigned int numEls) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < numEls) { // Optimize by checking boundary condition once
        dest[idx] = a[idx] * __cosf(b[idx]);
    }
}