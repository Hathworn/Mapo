#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel with coalesced memory access and reduced register pressure
__global__ void kAddScalar(float* a, float alpha, float* dest, unsigned int numEls) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < numEls) {
        dest[idx] = a[idx] + alpha; // Direct access for better memory coalescing
    }
}