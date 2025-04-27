#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0.0f;  // Use a local accumulator for reduction

    if (eidx < numElements) { // Ensure index within bounds
        for (; eidx < numElements; eidx += gridDim.x * DP_BLOCKSIZE) {
            sum += a[eidx] * b[eidx];
        }
    }

    shmem[threadIdx.x] = sum; // Store local sum into shared memory
    __syncthreads();

    // Perform block-wise reduction using efficient warp shuffle
    for (int offset = DP_BLOCKSIZE >> 1; offset > 0; offset >>= 1) {
        if (threadIdx.x < offset) {
            shmem[threadIdx.x] += shmem[threadIdx.x + offset];
        }
        __syncthreads();
    }

    // Write the reduced result for this block to global memory
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}