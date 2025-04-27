#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float local_sum = 0.0f; // Use local sum to reduce memory access contention

    if (eidx < numElements) {
        for (; eidx < numElements; eidx += gridDim.x * DP_BLOCKSIZE) {
            local_sum += a[eidx] * b[eidx];
        }
    }
    shmem[threadIdx.x] = local_sum; // Only write once to shared memory
    __syncthreads();

    // Use a loop for reduction to enhance readability and maintainability
    for (uint stride = DP_BLOCKSIZE / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            shmem[threadIdx.x] += shmem[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Final sum written to global memory
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}