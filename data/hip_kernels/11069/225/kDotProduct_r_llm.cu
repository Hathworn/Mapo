#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0.0f;

    // Use loop unrolling for efficiency
    for (uint i = eidx; i < numElements; i += gridDim.x * DP_BLOCKSIZE) {
        sum += a[i] * b[i];
    }

    shmem[threadIdx.x] = sum;
    __syncthreads();

    // Optimize reduction using warp-synchronous programming
    for (uint s = DP_BLOCKSIZE / 2; s > 0; s >>= 1) {
        if (threadIdx.x < s) {
            shmem[threadIdx.x] += shmem[threadIdx.x + s];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}