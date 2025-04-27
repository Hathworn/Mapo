#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void analyze(const float *input, float *sum, int numElements) {
    // Use shared memory to minimize global memory accesses
    extern __shared__ float sharedSum[];

    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int tid = threadIdx.x;

    sharedSum[tid] = (i < numElements) ? input[i] : 0.0f;
    __syncthreads();

    // Perform parallel reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sharedSum[tid] += sharedSum[tid + s];
        }
        __syncthreads();
    }

    // Use atomic operation to reduce partial sums from each block
    if (tid == 0) {
        atomicAdd(sum, sharedSum[0]);
    }
}