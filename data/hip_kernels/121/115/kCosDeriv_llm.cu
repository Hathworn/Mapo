#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kCosDeriv(float* a, float* b, float* dest, unsigned int numEls) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Loop unrolling for improved performance
    for (unsigned int i = idx; i < numEls; i += blockDim.x * gridDim.x) {
        float temp_a = a[i];
        float temp_b = b[i];
        dest[i] = -temp_a * __sinf(temp_b);
    }
}