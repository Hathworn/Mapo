#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dotProduct_CUDA_float(float *sum, int size, float *vector1, float *vector2) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Sequential thread index across the blocks
    // Use shared memory to optimize access for parallel threads
    __shared__ float temp[1024];
    if (idx < size) {
        temp[threadIdx.x] = vector2[idx] * vector1[idx];
    } else {
        temp[threadIdx.x] = 0.0f;
    }
    __syncthreads();

    // Reduction to compute the sum within a block
    if (threadIdx.x == 0) {
        float blockSum = 0.0f;
        for (int i = 0; i < blockDim.x; ++i) {
            blockSum += temp[i];
        }
        atomicAdd(sum, blockSum); // Atomic add to avoid race conditions
    }
}