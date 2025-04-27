#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kAddScalar(float* a, float alpha, float* dest, unsigned int numEls) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;
    
    // Loop optimised with a stride variable
    for (unsigned int i = idx; i < numEls; i += stride) {
        dest[i] = a[i] + alpha;
    }
}