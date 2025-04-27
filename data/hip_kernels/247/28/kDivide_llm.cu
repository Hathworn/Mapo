#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDivide(float* a, float* b, float* dest, unsigned int numEls) {
    // Simplified computation of the global thread index
    const unsigned int globalIdx = blockIdx.x * blockDim.x + threadIdx.x;
    // Retrieve total number of threads used in the kernel
    const unsigned int totalThreads = blockDim.x * gridDim.x;

    // Use stride loop for optimal memory access and work distribution
    for (unsigned int i = globalIdx; i < numEls; i += totalThreads) {
        dest[i] = __fdividef(a[i], b[i]); // Efficient division using intrinsic function
    }
}