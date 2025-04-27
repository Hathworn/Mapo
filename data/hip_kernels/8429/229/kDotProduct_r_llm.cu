#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    shmem[threadIdx.x] = 0;

    // Optimize loop unrolling for better performance
    while (eidx < numElements) {
        shmem[threadIdx.x] += a[eidx] * b[eidx];
        eidx += gridDim.x * DP_BLOCKSIZE;
    }

    __syncthreads();

    // Unroll the reduction loop using warp-level primitives
    if (threadIdx.x < 32) {
        for (int offset = 16; offset > 0; offset /= 2) {
            shmem[threadIdx.x] += __shfl_down_sync(0xffffffff, shmem[threadIdx.x], offset);
        }
    }

    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}