#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddMultSign(float* a, float* b, unsigned int numEls, float mult) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    for (unsigned int i = idx; i < numEls; i += stride) {
        float b_val = b[i]; // Load b[i] into a register
        float mult_sign = (b_val > 0) ? mult : ((b_val < 0) ? -mult : 0);
        a[i] += mult_sign; // Directly add to a[i] to avoid extra computation
    }
}