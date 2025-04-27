#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kExp(float* mat, float* target, unsigned int len) {
    // Use shared memory for better memory coalescing
    extern __shared__ float sharedMat[];
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;
    for (unsigned int i = idx; i < len; i += numThreads) {
        sharedMat[threadIdx.x] = mat[i];  // Load to shared memory
        __syncthreads();  // Synchronize threads to ensure all loads are complete
        target[i] = __expf(sharedMat[threadIdx.x]);  // Perform computation
        __syncthreads();  // Synchronize before next iteration
    }
}