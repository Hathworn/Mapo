#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAdd(float* a, float* b, float* dest, unsigned int numEls, float scaleA, float scaleB) {
    // Calculate global thread index for 1D grid
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Each thread processes multiple elements using a strided approach
    for (unsigned int i = idx; i < numEls; i += blockDim.x * gridDim.x) {
        dest[i] = scaleA * a[i] + scaleB * b[i];
    }
}