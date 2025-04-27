#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kCosDeriv(float* a, float* b, float* dest, unsigned int numEls) {
    // Optimize using shared memory for temporary storage
    __shared__ float sharedA[256]; // Adjust size based on blockDim.x

    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    for (unsigned int i = idx; i < numEls; i += numThreads) {
        // Load into shared memory
        sharedA[threadIdx.x] = -a[i];

        // Ensure all threads have written to shared memory
        __syncthreads();

        dest[i] = sharedA[threadIdx.x] * __sinf(b[i]);

        // Ensure all threads have read from shared memory before next iteration
        __syncthreads();
    }
}