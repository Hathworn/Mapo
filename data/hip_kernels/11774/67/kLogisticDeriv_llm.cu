#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogisticDeriv(float* a, float* b, float* dest, unsigned int numEls) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Use shared memory to reduce global memory access
    __shared__ float shared_a[256]; // Adjust the size based on blockDim.x
    __shared__ float shared_b[256];

    for (unsigned int i = idx; i < numEls; i += numThreads) {
        shared_a[threadIdx.x] = a[i];
        shared_b[threadIdx.x] = b[i];

        __syncthreads(); // Ensure all threads have loaded the data

        // Perform computation using shared memory
        dest[i] = shared_a[threadIdx.x] * shared_b[threadIdx.x] * (1.0 - shared_b[threadIdx.x]);

        __syncthreads(); // Prevent race conditions on shared memory
    }
}