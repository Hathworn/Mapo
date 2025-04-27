#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kRectifiedLinearSmoothDeriv(float* a, float* b, float* dest, unsigned int numEls) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Unroll loop by processing multiple elements per thread to improve memory access pattern
    for (unsigned int i = idx; i < numEls; i += blockDim.x * gridDim.x) {
        float bVal = b[i];
        dest[i] = a[i] * (1 - __expf(-bVal));
    }
}