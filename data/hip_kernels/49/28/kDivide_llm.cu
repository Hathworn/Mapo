#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDivide(float* a, float* b, float* dest, unsigned int numEls) {
    // Use shared memory to load elements for coalesced access
    __shared__ float sharedA[256];
    __shared__ float sharedB[256];
    
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Load data into shared memory
    if (idx < numEls) {
        sharedA[threadIdx.x] = a[idx];
        sharedB[threadIdx.x] = b[idx];
    }
    __syncthreads();

    // Perform division using shared memory
    if (idx < numEls) {
        for (unsigned int i = idx; i < numEls; i += numThreads) {
            dest[i] = __fdividef(sharedA[threadIdx.x], sharedB[threadIdx.x]);
        }
    }
}