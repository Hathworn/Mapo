#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numCols, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];
    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    shmem[threadIdx.x] = 0;
    if (eidx < numCols) {
        for (; eidx < numElements; eidx += numCols) {
            shmem[threadIdx.x] += a[eidx] * b[eidx];
        }
    }
    __syncthreads();

    // Perform reduction using warp shuffle to optimize sync and memory access
    for (int offset = DP_BLOCKSIZE / 2; offset > 0; offset /= 2) {
        shmem[threadIdx.x] += __shfl_down_sync(0xFFFFFFFF, shmem[threadIdx.x], offset);
    }
    
    // Write result to target, ensuring only the first thread writes
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}