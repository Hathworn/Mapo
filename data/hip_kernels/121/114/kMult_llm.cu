#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMult(float* a, float* b, float* dest, unsigned int numEls, float scale_targets) {
    // Use shared memory to reduce global memory access latency
    extern __shared__ float sharedMem[];

    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int tid = threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Copy data to shared memory
    if (idx < numEls) {
        sharedMem[tid] = a[idx] * b[idx];
    }
    __syncthreads();

    if (scale_targets == 0) {
        for (unsigned int i = idx; i < numEls; i += numThreads) {
            dest[i] = sharedMem[tid];
        }
    } else {
        for (unsigned int i = idx; i < numEls; i += numThreads) {
            dest[i] = scale_targets * dest[i] + sharedMem[tid];
        }
    }
}