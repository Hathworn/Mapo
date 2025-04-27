#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0.0f;  // Local accumulator
    // Loop unrolling for more efficient memory access
    for (int i = eidx; i < numElements; i += gridDim.x * DP_BLOCKSIZE) {
        sum += a[i] * b[i];
    }
    shmem[threadIdx.x] = sum;
    __syncthreads();

    // Reduce using warp-level operations
    if (threadIdx.x < 32) {
        volatile float* mysh = shmem;
        if(threadIdx.x + 32 < DP_BLOCKSIZE) mysh[threadIdx.x] += mysh[threadIdx.x + 32];
        if(threadIdx.x + 16 < DP_BLOCKSIZE) mysh[threadIdx.x] += mysh[threadIdx.x + 16];
        if(threadIdx.x + 8 < DP_BLOCKSIZE) mysh[threadIdx.x] += mysh[threadIdx.x + 8];
        if(threadIdx.x + 4 < DP_BLOCKSIZE) mysh[threadIdx.x] += mysh[threadIdx.x + 4];
        if(threadIdx.x + 2 < DP_BLOCKSIZE) mysh[threadIdx.x] += mysh[threadIdx.x + 2];
        if(threadIdx.x + 1 < DP_BLOCKSIZE) mysh[threadIdx.x] += mysh[threadIdx.x + 1];
    }

    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}