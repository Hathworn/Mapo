#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numCols, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    shmem[threadIdx.x] = 0;

    // Ensure all threads within a block are utilized
    for (uint i = eidx; i < numElements; i += DP_BLOCKSIZE * gridDim.x) {
        shmem[threadIdx.x] += a[i] * b[i];
    }
    
    __syncthreads();

    // Use loop unrolling for warp reduction
    for (uint stride = DP_BLOCKSIZE / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            shmem[threadIdx.x] += shmem[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Write the result for this block to global memory
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}