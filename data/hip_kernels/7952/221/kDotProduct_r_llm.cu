#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    shmem[threadIdx.x] = 0;

    if (eidx < numElements) {
        // Loop unrolling
        for (uint i = eidx; i < numElements; i += gridDim.x * DP_BLOCKSIZE) {
            shmem[threadIdx.x] += a[i] * b[i];
        }
    }

    __syncthreads();

    // Parallel reduction using warp-shuffle
    for (uint offset = DP_BLOCKSIZE / 2; offset > 0; offset >>= 1) {
        if (threadIdx.x < offset) {
            shmem[threadIdx.x] += shmem[threadIdx.x + offset];
        }
        __syncthreads();
    }

    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}