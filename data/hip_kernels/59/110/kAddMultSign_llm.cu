#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddMultSign(float* a, float* b, unsigned int numEls, float mult) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Optimize by replacing the loop with a stride pattern using blockDim.x
    for (unsigned int i = idx; i < numEls; i += blockDim.x * gridDim.x) {
        // Simplify ternary operation logic for efficiency
        a[i] += mult * ((b[i] > 0) - (b[i] < 0));
    }
}