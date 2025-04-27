#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddScalar(float* a, float alpha, float* dest, unsigned int numEls) {
    // Calculate the global index
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure we stay within bounds and avoid unnecessary iterations
    if (idx < numEls) {
        dest[idx] = a[idx] + alpha;
    }
}