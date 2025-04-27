#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAdd3(float* a, const float* b, const float* c, const unsigned int numEls, const float scaleA, const float scaleB, const float scaleC) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Unroll the loop for improved performance
    if (idx < numEls) {
        a[idx] = scaleA * a[idx] + scaleB * b[idx] + scaleC * c[idx];
        const unsigned int numThreads = blockDim.x * gridDim.x;
        unsigned int nextIdx = idx + numThreads;
        while (nextIdx < numEls) {
            a[nextIdx] = scaleA * a[nextIdx] + scaleB * b[nextIdx] + scaleC * c[nextIdx];
            nextIdx += numThreads;
        }
    }
}