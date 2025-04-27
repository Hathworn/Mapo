```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMult(float* a, float* b, float* dest, unsigned int numEls) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Calculate total number of threads
    const unsigned int numThreads = blockDim.x * gridDim.x;
    
    // Optimize loop by unrolling
    for (unsigned int i = idx; i < numEls; i += numThreads) {
        dest[i] = a[i] * b[i];
        
        // Unroll loop for better performance
        if (i + numThreads < numEls) {
            dest[i + numThreads] = a[i + numThreads] * b[i + numThreads];
        }
    }
}