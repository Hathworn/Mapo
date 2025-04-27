#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void analyze(const float *input, float *sum, int numElements) {
    // Use shared memory for partial sums to reduce contention on global memory
    __shared__ float partialSum[256]; // assuming blockDim.x = 256
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Initialize shared memory
    partialSum[threadIdx.x] = (i < numElements) ? input[i] : 0.0f;

    // Synchronize threads to ensure shared memory is initialized
    __syncthreads();

    // Reduction in shared memory
    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
        if (threadIdx.x < offset) {
            partialSum[threadIdx.x] += partialSum[threadIdx.x + offset];
        }
        __syncthreads();
    }

    // Write result for this block to global sum, using atomic add
    if (threadIdx.x == 0) {
        atomicAdd(sum, partialSum[0]);
    }
}