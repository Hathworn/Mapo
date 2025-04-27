#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numCols, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    shmem[threadIdx.x] = 0;

    // Optimize memory access pattern
    for (; eidx < numElements; eidx += gridDim.x * DP_BLOCKSIZE) {
        if (eidx < numCols) {
            shmem[threadIdx.x] += a[eidx] * b[eidx];
        }
    }

    __syncthreads();
    
    // Utilize warp shuffle for reduction
    for (int offset = DP_BLOCKSIZE / 2; offset > 0; offset >>= 1) {
        if (threadIdx.x < offset) {
            shmem[threadIdx.x] += shmem[threadIdx.x + offset];
        }
        __syncthreads();
    }

    // Final reduction and write result
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}