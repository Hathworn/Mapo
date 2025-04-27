#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize: Use shared memory to reduce contention on global memory
__global__ void analyze(const float *input, float *sum, int numElements) {
    extern __shared__ float sharedSum[];  // Declare shared memory
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int local_i = threadIdx.x;

    // Initialize shared memory
    if (local_i < numElements) {
        sharedSum[local_i] = 0;
    }
    __syncthreads();

    // Reduce the number of atomic operations
    if (i < numElements) {
        atomicAdd(&sharedSum[local_i], input[i]);
    }
    __syncthreads();

    // Write back to global memory
    if (local_i < numElements) {
        atomicAdd(sum + local_i, sharedSum[local_i]);
    }
}