#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kAdd(float* a, float* b, float* dest, unsigned int numEls) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < numEls) { // Efficient conditional check
        dest[idx] = a[idx] + b[idx]; // Direct computation without loop
    }
}