#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    shmem[threadIdx.x] = 0;

    // Improved loop, avoiding unnecessary reg computation for eidx.
    if (eidx < numElements) {
        for (; eidx < numElements; eidx += DP_BLOCKSIZE * gridDim.x) {
            shmem[threadIdx.x] += a[eidx] * b[eidx];
        }
    }
    __syncthreads();

    // Optimized reduction using loop approach for better maintainability and scalability.
    for (uint offset = DP_BLOCKSIZE / 2; offset > 0; offset >>= 1) {
        if (threadIdx.x < offset) {
            shmem[threadIdx.x] += shmem[threadIdx.x + offset];
        }
        __syncthreads();
    }

    // Final storage of results
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}