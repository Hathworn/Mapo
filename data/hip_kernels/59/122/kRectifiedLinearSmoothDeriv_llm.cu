#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kRectifiedLinearSmoothDeriv(float* a, float* b, float* dest, unsigned int numEls) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Optimize loop by ensuring each thread handles only the valid range
    if (idx < numEls) {
        dest[idx] = a[idx] * (1 - __expf(-b[idx]));
    }
}