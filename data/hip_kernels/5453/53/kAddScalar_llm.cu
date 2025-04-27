#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddScalar(float* a, float alpha, float* dest, unsigned int numEls) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure threads do not exceed array bounds
    if (idx < numEls) {
        dest[idx] = a[idx] + alpha;
    }
}