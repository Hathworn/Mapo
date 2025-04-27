#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    shmem[threadIdx.x] = 0.0f;

    // Improved loop iteration to reduce divergence
    for (uint i = eidx; i < numElements; i += blockDim.x * gridDim.x) {
        shmem[threadIdx.x] += a[i] * b[i];
    }

    __syncthreads();

    // Optimized reduction using fewer synchronization points
    for (uint s = blockDim.x / 2; s > 0; s >>= 1) {
        if (threadIdx.x < s) {
            shmem[threadIdx.x] += shmem[threadIdx.x + s];
        }
        __syncthreads();
    }

    // Single thread writes the block's result to global memory
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}