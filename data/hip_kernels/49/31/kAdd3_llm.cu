#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAdd3(float* a, const float* b, const float* c, const unsigned int numEls, const float scaleA, const float scaleB, const float scaleC) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Use shared memory for temporary storage
    extern __shared__ float tempA[];

    for (unsigned int i = idx; i < numEls; i += numThreads) {
        // Pre-fetch in a shared memory buffer
        tempA[threadIdx.x] = a[i];

        // Perform computation using shared memory 
        a[i] = scaleA * tempA[threadIdx.x] + scaleB * b[i] + scaleC * c[i];
    }
}