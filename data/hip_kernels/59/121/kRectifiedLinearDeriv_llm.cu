#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kRectifiedLinearDeriv(float* a, float* b, float* dest, unsigned int numEls) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Unroll the loop for performance optimization
    for (unsigned int i = idx; i < numEls; i += blockDim.x * gridDim.x * 4) {
        if (i < numEls) dest[i] = a[i] * (b[i] > 0 ? 1 : 0);
        if (i + blockDim.x * gridDim.x < numEls) dest[i + blockDim.x * gridDim.x] = a[i + blockDim.x * gridDim.x] * (b[i + blockDim.x * gridDim.x] > 0 ? 1 : 0);
        if (i + 2 * blockDim.x * gridDim.x < numEls) dest[i + 2 * blockDim.x * gridDim.x] = a[i + 2 * blockDim.x * gridDim.x] * (b[i + 2 * blockDim.x * gridDim.x] > 0 ? 1 : 0);
        if (i + 3 * blockDim.x * gridDim.x < numEls) dest[i + 3 * blockDim.x * gridDim.x] = a[i + 3 * blockDim.x * gridDim.x] * (b[i + 3 * blockDim.x * gridDim.x] > 0 ? 1 : 0);
    }
}