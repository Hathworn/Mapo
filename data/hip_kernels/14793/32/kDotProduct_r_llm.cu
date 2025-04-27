#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numCols, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    shmem[threadIdx.x] = 0;

    // Efficient iteration with strided accesses
    for (uint i = eidx; i < numElements; i += DP_BLOCKSIZE * gridDim.x) {
        shmem[threadIdx.x] += a[i] * b[i];
    }
    __syncthreads();

    // Warp-level reduction using efficient loop unrolling
    if (threadIdx.x < 32) {
        volatile float* mysh = &shmem[threadIdx.x];
        if (DP_BLOCKSIZE >= 64) *mysh += mysh[32];
        if (DP_BLOCKSIZE >= 32) *mysh += mysh[16];
        if (DP_BLOCKSIZE >= 16) *mysh += mysh[8];
        if (DP_BLOCKSIZE >= 8) *mysh += mysh[4];
        if (DP_BLOCKSIZE >= 4) *mysh += mysh[2];
        if (DP_BLOCKSIZE >= 2) *mysh += mysh[1];
    }
    // Store and synchronize only for the first thread in the block
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}