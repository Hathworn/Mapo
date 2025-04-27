#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kSinDeriv(float* a, float* b, float* dest, unsigned int numEls) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Optimize by unrolling loops to enhance parallel execution efficiency
    if (idx < numEls) {
        dest[idx] = a[idx] * __cosf(b[idx]);
    }
}