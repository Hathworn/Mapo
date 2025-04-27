#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDivide(float* a, float* b, float* dest, unsigned int numEls) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Use grid-stride loop to efficiently utilize all threads
    for (unsigned int i = idx; i < numEls; i += stride) {
        dest[i] = a[i] / b[i];
    }
}