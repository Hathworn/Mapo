#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kCosDeriv(float* a, float* b, float* dest, unsigned int numEls) {
    // Cache thread-specific index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the thread index does not exceed the number of elements
    if (idx < numEls) {
        dest[idx] = -a[idx] * __sinf(b[idx]); // Compute directly without loop
    }
}